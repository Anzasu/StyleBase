import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:sqflite_common/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:style_base/backend/models/ClothingItem.dart';

class DatabaseService {
  static Database? _db;
  static final DatabaseService instance = DatabaseService._constructor();
  DatabaseService._constructor();

  Future<Database> get database async {
    if (_db != null) {
      return _db!;
    } else {
      _db = await getDatabase();
      return _db!;
    }
  }

  String seasonsTable = 'Seasons';
  String colSeason = 'season_name';

  String colorTable = 'Colours';
  String colColor = 'colour_name';

  String typeTable = 'Types';
  String colType = 'type_name';

  String categoryTable = 'Category';
  String colCategory = 'category_name';

  String clothingItemsTable = 'ClothingItems';
  String colItemID = 'id';
  String colItemName = 'item_name';

  String colSeasonID = 'season_id';
  String colColorID = 'colour_id';
  String colTypeID = 'type_id';
  String colCategoryID = 'category_id';

  Future<Database> getDatabase() async {
    if (kIsWeb) {
      throw Exception("SQLite not supported on web!");
    }

    if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      databaseFactory = databaseFactoryFfi;
    }
    final databseDirPath = await getDatabasesPath();
    final databasePath = join(databseDirPath, "stylebase_db.db");

    await deleteDatabase(databasePath);

    final database = await openDatabase(databasePath, version: 1,
        onCreate: (db, version) async {
      await db.transaction((trxn) async {
        trxn.execute('''
        CREATE TABLE $seasonsTable (
          $colSeasonID INTEGER PRIMARY KEY AUTOINCREMENT,
          $colSeason TEXT NOT NULL UNIQUE
        );
      ''');

        trxn.execute('''
        CREATE TABLE $categoryTable (
          $colCategoryID INTEGER PRIMARY KEY AUTOINCREMENT,
          $colCategory TEXT NOT NULL UNIQUE
        );
      ''');

        trxn.execute('''
       CREATE TABLE $typeTable (
        $colTypeID INT AUTO_INCREMENT PRIMARY KEY,
        $colType VARCHAR(50) NOT NULL UNIQUE
        );
      ''');

        trxn.execute('''
        CREATE TABLE $colorTable (
        $colColorID INT AUTO_INCREMENT PRIMARY KEY,
        $colColor VARCHAR(50) NOT NULL UNIQUE
        );
      ''');

        trxn.execute('''
        CREATE TABLE $clothingItemsTable (
          $colItemID INTEGER PRIMARY KEY AUTOINCREMENT,
          $colItemName TEXT NOT NULL,
          $colSeasonID INTEGER,
          $colCategoryID INTEGER,
          $colTypeID INTEGER,
          $colColorID INTEGER,
          FOREIGN KEY ($colSeasonID) REFERENCES $seasonsTable($colSeasonID),
          FOREIGN KEY ($colCategoryID) REFERENCES $categoryTable($colCategoryID),
          FOREIGN KEY ($colTypeID) REFERENCES $typeTable($colTypeID),
          FOREIGN KEY ($colColorID) REFERENCES $colorTable($colColorID)
        );
        ''');

        await insertInitial(trxn);
      });
    });

    final count =
        await database.rawQuery('SELECT COUNT(*) FROM $clothingItemsTable');
    debugPrint('Total items in DB: ${count.first.values.first}');

    return database;
  }

  // ********** ADD CLOTHING ITEM ***********
  void addItem(
      String name, int season, int color, int type, int category) async {
    final db = await database;
    await db.transaction((txn) async {
      await txn.insert(clothingItemsTable, {
        colItemName: name,
        colSeasonID: season,
        colCategoryID: category,
        colTypeID: type,
        colColorID: color,
      });
    });
  }

  // ************* READ CLOTHING ITEMS FROM THE DB ********
  Future<List<ClothingItem>> getAllItems() async {
    final db = await database;
    final data = await db.query(clothingItemsTable);
    List<ClothingItem> items =
        data.map((e) => ClothingItem.fromMapObject(e)).toList();

    debugPrint('Raw database results: $data');
    return items;
  }

  Future<List<ClothingItem>> getCategoryItems(int category) async {
    try {
      final db = await database;
      final where = category > 0 ? '$colCategoryID = ?' : null;
      final whereArgs = category > 0 ? [category] : null;

      final data = await db.query(
        clothingItemsTable,
        where: where,
        whereArgs: whereArgs,
      );

      debugPrint('Raw database results: $data');

      return data.map((e) => ClothingItem.fromMapObject(e)).toList();
    } catch (e) {
      debugPrint('Error in getCategoryItems: $e');
      return [];
    }
  }

  Future<List<ClothingItem>> getColorItems(int color) async {
    try {
      final db = await database;
      final data = await db.query(
        clothingItemsTable,
        where: '$colColorID = ?',
        whereArgs: [color],
      );

      return data.map((e) => ClothingItem.fromMapObject(e)).toList();
    } catch (e) {
      debugPrint('Error in getColorItems: $e');
      return [];
    }
  }

  Future<List<ClothingItem>> getTypeItems(int type) async {
    try {
      final db = await database;
      final data = await db.query(
        clothingItemsTable,
        where: '$colTypeID = ?',
        whereArgs: [type],
      );

      return data.map((e) => ClothingItem.fromMapObject(e)).toList();
    } catch (e) {
      debugPrint('Error in getTypeItems: $e');
      return [];
    }
  }

  Future<List<ClothingItem>> getSeasonItems(int season) async {
    try {
      final db = await database;
      final data = await db.query(
        clothingItemsTable,
        where: '$colSeasonID = ?',
        whereArgs: [season],
      );

      return data.map((e) => ClothingItem.fromMapObject(e)).toList();
    } catch (e) {
      debugPrint('Error in getSeasonItems: $e');
      return [];
    }
  }

  Future<List<ClothingItem>> getSearchItems({
    int? category,
    int? season,
    int? type,
    int? color,
    String? name,
  }) async {
    final db = await database;

    try {
      final query = StringBuffer('SELECT * FROM $clothingItemsTable');
      final whereClauses = <String>[];
      final whereArgs = <dynamic>[];

      void addCondition(String column, dynamic value) {
        if (value != null && value != 0) {
          whereClauses.add('$column = ?');
          whereArgs.add(value);
        }
      }

      addCondition(colCategoryID, category);
      addCondition(colSeasonID, season);
      addCondition(colTypeID, type);
      addCondition(colColorID, color);

      if (name != null && name.isNotEmpty) {
        whereClauses.add('$colItemName LIKE ?');
        whereArgs.add('%$name%');
      }

      if (whereClauses.isNotEmpty) {
        query.write(' WHERE ${whereClauses.join(' AND ')}');
      }

      final data = await db.rawQuery(query.toString(), whereArgs);

      return data.map((e) => ClothingItem.fromMapObject(e)).toList();
    } catch (e) {
      debugPrint('Error in getSearchItems: $e');
      return [];
    }
  }

  // ************* FILLING TABLE WITH INITIAL VALUES ***************

  Future<void> insertInitial(DatabaseExecutor db) async {
    await db.rawInsert('''
        INSERT INTO $seasonsTable ($colSeason)
        VALUES 
        ('unspecified'),
        ('Summer'),
        ('Winter'),
        ('Fall'),
        ('Spring');
      ''');

    await db.rawInsert('''
        INSERT INTO $categoryTable ($colCategory)
        VALUES
        ('unspecified'), 
        ('Casual wear'),
        ('Traditional wear'),
        ('Formal wear'),
        ('Sports wear');
     ''');

    await db.rawInsert('''
        INSERT INTO $colorTable ($colColor)
        VALUES
        ('unspecified'), 
        ('Red'),
        ('Black'),
        ('Blue'),
        ('White'),
        ('Green'),
        ('Yellow');
    ''');

    await db.rawInsert('''
        INSERT INTO $typeTable ($colType)
        VALUES
        ('unspecified'), 
        ('Shirts'),
        ('Pants'),
        ('Skirts'),
        ('Dresses'),
        ('Jackets');
    ''');

    await db.rawInsert('''
      INSERT INTO $clothingItemsTable (
      $colItemName, $colSeasonID, $colCategoryID, $colTypeID, $colColorID
      ) VALUES
        ('Blue Summer TShirt', 1, 1, 1, 3),
        ('Favorite Winter Sweater', 2, 1, 1, 3),
        ('Black Formal Trousers',	3,	3,	2,	2),
        ('White Spring Blouse',	4,	1,	1,	4),
        ('Green Fall Jacket',	2,	1,	5,	5),
        ('Yellow Summer Dress',	1,	1,	4,	6),
        ('Blue Sports Shorts',	1,	4,	2,	3),
        ('Black Leather Jacket',	2	,1,	5	,2),
        ('Yellow Party Dress',	1	,3	,4,	6),
        ('Green Traditional Kurta',	2,	2,	1,	5),
        ('Red Chinos',	4,	1,	2,	1),
        ('Black Rain Coat',	4,	1,	5,	2),
        ('Dark Blue Jeans',	3,	1,	2,	3);
    ''');
  }
}

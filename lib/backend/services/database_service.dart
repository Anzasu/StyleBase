import 'package:sqflite_common/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

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
    final databseDirPath = await getDatabasesPath();
    final databasePath = join(databseDirPath, "stylebase_db.db");
    final database = await openDatabase(databasePath, onCreate: (db, version) {
      db.execute('''
        CREATE TABLE $seasonsTable (
        $colSeasonID INT AUTO_INCREMENT PRIMARY KEY,
        $colSeason VARCHAR(50) NOT NULL UNIQUE
        );

        CREATE TABLE $categoryTable (
        $colCategoryID INT AUTO_INCREMENT PRIMARY KEY,
        $colCategory VARCHAR(100) NOT NULL UNIQUE
        );

        CREATE TABLE $typeTable (
        $colTypeID INT AUTO_INCREMENT PRIMARY KEY,
        $colType VARCHAR(50) NOT NULL UNIQUE
        );

        CREATE TABLE $colorTable (
        $colColorID INT AUTO_INCREMENT PRIMARY KEY,
        $colColor VARCHAR(50) NOT NULL UNIQUE
        );

        CREATE TABLE $clothingItemsTable (
        $colItemID INT AUTO_INCREMENT PRIMARY KEY,          
        $colItemName VARCHAR(255) NOT NULL,                 
        $colSeasonID INT,                                   
        $colCategoryID INT,                                 
        $colTypeID INT,                                     
        $colColorID INT,                                   

        FOREIGN KEY ($colSeasonID) REFERENCES $seasonsTable($colSeasonID)
        ON DELETE SET NULL ON UPDATE CASCADE, -- Or ON DELETE RESTRICT if a season is mandatory
        FOREIGN KEY ($colCategoryID) REFERENCES $categoryTable($colCategoryID)
        ON DELETE SET NULL ON UPDATE CASCADE, -- Or ON DELETE RESTRICT
        FOREIGN KEY ($colTypeID) REFERENCES $typeTable($colTypeID)
        ON DELETE SET NULL ON UPDATE CASCADE, -- Or ON DELETE RESTRICT
        FOREIGN KEY ($colColorID) REFERENCES $colorTable($colColorID)
        ON DELETE SET NULL ON UPDATE CASCADE  -- Or ON DELETE RESTRICT
        );
        '''); //TODO: sql commands to fill seasons, type, color and category with values on create
    });

    return database;
  }
}

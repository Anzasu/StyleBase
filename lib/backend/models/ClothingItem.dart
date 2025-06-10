class ClothingItem {
  final int id;
  late final String name;
  late final int season;
  late final int color;
  late final int category;
  late final int type;

  // Main constructor
  ClothingItem({
    required this.id,
    required this.name,
    required this.season,
    required this.color,
    required this.category,
    required this.type,
  });

  // Factory constructor for creating items from database
  factory ClothingItem.fromMapObject(Map<String, dynamic> map) {
    return ClothingItem(
      id: map['id'] as int? ?? 0,
      name: map['item_name'] as String? ?? '',
      season: map['season_id'] as int? ?? 0,
      color: map['colour_id'] as int? ?? 0,
      category: map['category_id'] as int? ?? 0,
      type: map['type_id'] as int? ?? 0,
    );
  }

  // Named constructor for creating new items (without ID)
  factory ClothingItem.create({
    required String name,
    required int season,
    required int color,
    required int category,
    required int type,
  }) {
    return ClothingItem(
      id: 0, // Default ID for new items
      name: name,
      season: season,
      color: color,
      category: category,
      type: type,
    );
  }

  // Convert to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'item_name': name,
      'season_id': season,
      'colour_id': color,
      'category_id': category,
      'type_id': type,
    };
  }

  // Helper methods for string conversions
  String get seasonName {
    return const {
          1: 'summer',
          2: 'winter',
          3: 'fall',
          4: 'spring',
        }[season] ??
        'unspecified';
  }

  String get colorName {
    return const {
          1: 'red',
          2: 'black',
          3: 'blue',
          4: 'white',
          5: 'green',
          6: 'yellow',
        }[color] ??
        'unspecified';
  }

  String get typeName {
    return const {
          1: 'shirts',
          2: 'pants',
          3: 'skirts',
          4: 'dresses',
          5: 'jackets',
        }[type] ??
        'unspecified';
  }

  String get categoryName {
    return const {
          1: 'casual',
          2: 'traditional',
          3: 'formal',
          4: 'sports',
        }[category] ??
        'unspecified';
  }

  @override
  String toString() {
    return 'ClothingItem(id: $id, name: "$name", season: $season ($seasonName), '
        'color: $color ($colorName), category: $category ($categoryName), '
        'type: $type ($typeName))';
  }
}

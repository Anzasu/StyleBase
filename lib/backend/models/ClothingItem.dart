class ClothingItem {
  final int id;
  final String name;
  final int season;
  final int color;
  final int category;
  final int type;

  const ClothingItem({
    required this.id,
    required this.name,
    required this.season,
    required this.color,
    required this.category,
    required this.type,
  });

  factory ClothingItem.empty() => const ClothingItem(
        id: 0,
        name: "",
        season: 0,
        color: 0,
        category: 0,
        type: 0,
      );

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

  factory ClothingItem.create({
    required String name,
    required int season,
    required int color,
    required int category,
    required int type,
  }) {
    return ClothingItem(
      id: 0,
      name: name,
      season: season,
      color: color,
      category: category,
      type: type,
    );
  }

  ClothingItem copyWith({
    int? id,
    String? name,
    int? season,
    int? color,
    int? category,
    int? type,
  }) {
    return ClothingItem(
      id: id ?? this.id,
      name: name ?? this.name,
      season: season ?? this.season,
      color: color ?? this.color,
      category: category ?? this.category,
      type: type ?? this.type,
    );
  }

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

  String get seasonName =>
      const {
        1: 'Summer',
        2: 'Winter',
        3: 'Fall',
        4: 'Spring',
      }[season] ??
      'unspecified';

  String get colorName =>
      const {
        1: 'Red',
        2: 'Black',
        3: 'Blue',
        4: 'White',
        5: 'Green',
        6: 'Yellow',
      }[color] ??
      'unspecified';

  String get typeName =>
      const {
        1: 'Shirts',
        2: 'Pants',
        3: 'Skirts',
        4: 'Dresses',
        5: 'Jackets',
      }[type] ??
      'unspecified';

  String get categoryName =>
      const {
        1: 'Casual wear',
        2: 'Traditional wear',
        3: 'Formal wear',
        4: 'Sports wear',
      }[category] ??
      'unspecified';

  @override
  String toString() {
    return 'ClothingItem(id: $id, name: "$name", season: $season ($seasonName), '
        'color: $color ($colorName), category: $category ($categoryName), '
        'type: $type ($typeName))';
  }
}

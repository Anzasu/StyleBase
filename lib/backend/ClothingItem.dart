import 'package:flutter/foundation.dart';
import 'package:style_base/backend/globals.dart';

class ClothingItem {
  // if the user does not specifiy seaso, color, type or category, the value will be 0. The id 0 equals undefined in our table.
  // ID is mandatory and will be generated automatically
  int _item_id = 0;
  String _item_name = "";
  int _season_id = 0;
  int _color_id = 0;
  int _category_id = 0;
  int _type_id = 0;

  int get id => _item_id;
  int get season => _season_id;
  int get color => _color_id;
  int get category => _category_id;
  int get type => _type_id;
  String get name => _item_name;

  ClothingItem.withId(this._item_id, this._item_name, this._category_id,
      this._color_id, this._season_id, this._type_id);
  ClothingItem(this._item_name, this._category_id, this._color_id,
      this._season_id, this._type_id);

  set Season(String season) {
    if (season == "summer") {
      this._season_id = 1;
    } else if (season == "winter") {
      this._season_id = 2;
    } else if (season == "fall") {
      this._season_id = 3;
    } else if (season == "spring") {
      this._season_id = 4;
    } else {
      this._season_id = 0;
    }
  }

  set Color(String color) {
    if (color == "red") {
      this._color_id = 1;
    } else if (color == "black") {
      this._color_id = 2;
    } else if (color == "blue") {
      this._color_id = 3;
    } else if (color == "white") {
      this._color_id = 4;
    } else if (color == "green") {
      this._color_id = 5;
    } else if (color == "white") {
      this._color_id = 4;
    } else {
      this._color_id = 0;
    }
  }

  set Type(String type) {
    if (type == "shirts") {
      this._type_id = 1;
    } else if (type == "pants") {
      this._type_id = 2;
    } else if (type == "skirts") {
      this._type_id = 3;
    } else if (type == "dresses") {
      this._type_id = 4;
    } else if (type == "jackets") {
      this._type_id = 5;
    } else {
      this._type_id = 0;
    }
  }

  set Category(String category) {
    if (category == "casual") {
      this._category_id = 1;
    } else if (category == "traditional") {
      this._category_id = 2;
    } else if (category == "formal") {
      this._category_id = 3;
    } else if (category == "sports") {
      this._category_id = 4;
    } else {
      this._category_id = 0;
    }
  }

  // ******** Map from ClothingItem conversion *************

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    if (id != null) {
      map['id'] = _item_id;
    }

    map['name'] = _item_name;
    map['season'] = _season_id;
    map['color'] = _color_id;
    map['category'] = _category_id;
    map['type'] = _type_id;

    return map;
  }

  // *********** ClothingItem from Map *********

  ClothingItem.fromMapObject(Map<String, dynamic> map) {
    this._item_id = map['name'];
    this._season_id = map['season'];
    this._color_id = map['color'];
    this._category_id = map['category'];
    this._type_id = map['type'];
  }
}

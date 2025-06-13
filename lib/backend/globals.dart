library globals;

import 'package:style_base/backend/models/ClothingItem.dart';

// *************************** FOR FILTERED RESULT AND SEARCH ************************
int filterCategory = 1;

int filterType = 1;

int filterSeason = 1;

int filterColor = 1;

String name = "";
List<String> color = [];
List<String> type = [];
List<String> season = [];
List<String> category = [];

// ******************** FOR UPDATE CLOTHING ITEM AND ADD CLOTHIG ITEM ***************************

/*int helperID = 0;
String helperName = "";
int helperSeason = 0;
int helperColor = 0;
int helperType = 0;
int helperCategory = 0; */

ClothingItem currentClothingItem = ClothingItem(
  id: 0,
  name: "Default",
  season: 0,
  color: 0,
  category: 0,
  type: 0,
);

int get currentItemID => currentClothingItem.id;
String get currentName => currentClothingItem.name;
int get currentSeasonID => currentClothingItem.season;
int get currentColorID => currentClothingItem.color;
int get currentTypeID => currentClothingItem.type;
int get currentCategoryID => currentClothingItem.category;

void setCurrentItemName(String name) {
  currentClothingItem = currentClothingItem.copyWith(name: name);
}

void setCurrentItemSeason(String season) {
  int id;
  if (season == "Summer") {
    id = 1;
  } else if (season == "Winter") {
    id = 2;
  } else if (season == "Fall") {
    id = 3;
  } else if (season == "Spring") {
    id = 4;
  } else {
    id = 0;
  }
  currentClothingItem = currentClothingItem.copyWith(season: id);
}

void setCurrentItemColor(String color) {
  int id;
  if (color == "Red") {
    id = 1;
  } else if (color == "Black") {
    id = 2;
  } else if (color == "Blue") {
    id = 3;
  } else if (color == "White") {
    id = 4;
  } else if (color == "Green") {
    id = 5;
  } else if (color == "Yellow") {
    id = 6;
  } else {
    id = 0;
  }
  currentClothingItem = currentClothingItem.copyWith(color: id);
}

void setCurrentItemType(String type) {
  int id;
  if (type == "Shirts") {
    id = 1;
  } else if (type == "Pants") {
    id = 2;
  } else if (type == "Skirts") {
    id = 3;
  } else if (type == "Dresses") {
    id = 4;
  } else if (type == "Jackets") {
    id = 5;
  } else {
    id = 0;
  }
  currentClothingItem = currentClothingItem.copyWith(type: id);
}

void setCurrentItemCategory(String category) {
  int id;
  if (category == "Casual wear") {
    id = 1;
  } else if (category == "Traditional wear") {
    id = 2;
  } else if (category == "Formal wear") {
    id = 3;
  } else if (category == "Sports") {
    id = 4;
  } else {
    id = 0;
  }
  currentClothingItem = currentClothingItem.copyWith(category: id);
}

// Full item setter
void setCurrentClothingItem(ClothingItem item) {
  currentClothingItem = item;
}

// Reset to empty
void resetCurrentClothingItem() {
  currentClothingItem = ClothingItem.empty();
}

library globals;

import 'package:style_base/backend/models/ClothingItem.dart';

// *************************** FOR FILTERED RESULT AND SEARCH ************************
int filterCategory = 1;
bool filterCasual = false;
bool filterTraditional = false;
bool filterSports = false;
bool filterFormal = false;

int filterType = 1;
bool filterShirts = false;
bool filterPants = false;
bool filterSkirts = false;
bool filterDresses = false;
bool filterJackets = false;

int filterSeason = 1;
bool filterSummer = false;
bool filterWinter = false;
bool filterFall = false;
bool filterSpring = false;

int filterColor = 1;
bool filterRed = false;
bool filterBlue = false;
bool filterBlack = false;
bool filterWhite = false;
bool filterGreen = false;
bool filterYellow = false;

// ******************** FOR UPDATE CLOTHING ITEM AND ADD CLOTHIG ITEM ***************************

ClothingItem currentClothingItem = ClothingItem(
  id: 0,
  name: "Test",
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

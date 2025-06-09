library globals;

import 'package:style_base/backend/ClothingItem.dart';

// *************************** FOR FILTERED RESULT AND SEARCH ************************
bool filterCategory = false;
bool filterCasual = false;
bool filterTraditional = false;
bool filterSports = false;
bool filterFormal = false;

bool filterType = false;
bool filterShirts = false;
bool filterPants = false;
bool filterSkirts = false;
bool filterDresses = false;
bool filterJackets = false;

bool filterSeason = false;
bool filterSummer = false;
bool filterWinter = false;
bool filterFall = false;
bool filterSpring = false;

bool filterColor = false;
bool filterRed = false;
bool filterBlue = false;
bool filterBlack = false;
bool filterWhite = false;
bool filterGreen = false;
bool filterYellow = false;

// ******************** FOR UPDATE CLOTHING ITEM AND ADD CLOTHIG ITEM ***************************
int currentItemID = 0;
ClothingItem currentClothingItem = new ClothingItem("default", 0, 0, 0, 0);
int currentSeasonID = 0;
int currentColorID = 0;
int currentTypeID = 0;
int currentCategoryID = 0;

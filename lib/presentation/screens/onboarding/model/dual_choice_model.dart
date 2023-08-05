class DualChoiceModel {
  final int stepCount;
  final String topTitleContent, bottomTileContent;

  DualChoiceModel({
    required this.stepCount,
    required this.topTitleContent,
    required this.bottomTileContent,
  });
}

// Gender Model
DualChoiceModel genderTypeModel = DualChoiceModel(
  stepCount: 3,
  topTitleContent: "Which one are you ?",
  bottomTileContent: "For personalised experience please choose your gender",
);

// FoodType Model
DualChoiceModel foodTypeModel = DualChoiceModel(
  stepCount: 6,
  topTitleContent: "Which food do you prefer ?",
  bottomTileContent:
      "For personalised food diet recommendations please choose your food prefernce",
);

// RegionModel
DualChoiceModel stateTypeModel = DualChoiceModel(
  stepCount: 7,
  topTitleContent: "Which part do you belong ?",
  bottomTileContent:
      "For personalised seasonal recommendations please choose your region",
);

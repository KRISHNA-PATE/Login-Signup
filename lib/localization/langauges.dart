final List<LanguageModel> languages = [
  LanguageModel("English", "en"),
  LanguageModel("Hindi", "hi"),
  LanguageModel("Gujarati", "gu"),
];

class LanguageModel {
  LanguageModel(
    this.language,
    this.symbol,
  );

  String language;
  String symbol;
}

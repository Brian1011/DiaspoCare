class CountryModel {
  final String name;
  final String code;
  CountryModel({
    this.name,
    this.code,
  });

  factory CountryModel.fromMap(country) {
    return CountryModel(
      name: country['name'],
      code: country['code'],
    );
  }
}

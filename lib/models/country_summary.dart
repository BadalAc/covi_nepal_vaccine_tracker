class CountrySummaryModel {
  final String country;
  final int confirmed;
  final int death;
  final int recovered;
  final int active;

  CountrySummaryModel(
    this.country,
    this.confirmed,
    this.death,
    this.recovered,
    this.active,
  );

  factory CountrySummaryModel.fromJson(Map<String, dynamic> json) {
    return CountrySummaryModel(
      json["Country"],
      json["Confirmed"],
      json["Deaths"],
      json["Recovered"],
      json["Active"],
    );
  }
}

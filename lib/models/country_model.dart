class CountryModel {
  final int? id;
  final String? name;
  final String? capital;
  // ignore: non_constant_identifier_names
  final String? short_description;
  final String? flag;
  CountryModel({
    this.id,
    this.name,
    this.capital,
    // ignore: non_constant_identifier_names
    this.short_description,
    this.flag,
  });
  // create factory name contractor

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      id: json['id'],
      name: json['name'],
      capital: json['capital'],
      short_description: json['short_description'],
      flag: json['flag'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["capital"] = capital;
    data["short_description"] = short_description;
    data["flag"] = flag;
    return data;
  }
}

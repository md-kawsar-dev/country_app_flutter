import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/country_model.dart';

class CountryRepository {
  static const String _baseUrl = "https://countrylist.teamrabbil.com";
  static const String _countryListEndpoint = "/api/country-list";

  Future<List<CountryModel>> getCountries() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl$_countryListEndpoint'),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        return jsonData.map((json) => CountryModel.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load Countries: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Failed to load Countries: $e");
    }
  }
}

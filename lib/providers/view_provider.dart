import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weatherapp/models/weather_model.dart';

class ViewProvider extends ChangeNotifier {
  WeatherModel? weatherModel;

  Future<void> fetchData() async {
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=11.2588&lon=75.7804&appid=8b814ab30ad7f28fa3170594a39af068'); // Replace with your API URL

    try {
      final response = await http.get(url);
      print(response.statusCode);
      if (response.statusCode == 200) {
        // Successful response
        final data = json.decode(response.body);
        weatherModel = WeatherModel.fromJson(data);
        notifyListeners();
      } else {
        // Handle error
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // Handle exceptions
      print('Error: $e');
    }
  }
}

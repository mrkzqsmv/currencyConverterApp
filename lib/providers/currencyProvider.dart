import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrencyProvider with ChangeNotifier {
  double _value = 0.0;

  double get value => _value;

  Future getCurrencies(String fromCurrency, String toCurrency) async {
    String baseUrl =
        'https://api.currencyapi.com/v3/latest?apikey=cur_live_nIKlPjSl9HQ2RcqM0lVqfNyxOx2qjn8Akz83lTQM&base_currency=$fromCurrency&currencies=$toCurrency';

    Dio dio = Dio();

    try {
      Response response = await dio.get(baseUrl);
      if (response.statusCode == 200) {
        debugPrint('Response: ${response.data}');

        Map<String, dynamic> responseData = response.data;

        double exchangeRate = responseData['data'][toCurrency]['value'];

        _value = exchangeRate;
        notifyListeners();
      } else {
        debugPrint('You have error');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

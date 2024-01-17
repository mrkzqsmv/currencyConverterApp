import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrencyApi with ChangeNotifier{
  double? value;
  Future getCurrencies() async {
    String baseUrl =
        'https://api.currencyapi.com/v3/latest?apikey=cur_live_nIKlPjSl9HQ2RcqM0lVqfNyxOx2qjn8Akz83lTQM&base_currency=AZN&currencies=USD';

    Dio dio = Dio();

    try {
      Response response = await dio.get(baseUrl);
      print(response.data);
      print(response.statusCode);
      print(response.data['data']['USD']['code']);
      print(response.data['data']['USD']['value']);
      value = response.data['data']['USD']['value'];
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

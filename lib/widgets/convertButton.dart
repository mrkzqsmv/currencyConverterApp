import 'package:currency_converter_app/providers/currencyProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConvertButton extends StatelessWidget {
  final String fromCurrency;
  final String toCurrency;
  const ConvertButton(
      {super.key, required this.fromCurrency, required this.toCurrency});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint('Convert button pressed');
        context
            .read<CurrencyProvider>()
            .getCurrencies(fromCurrency, toCurrency);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 15.0,
          ),
          decoration: BoxDecoration(
            color: Colors.blue.shade300,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: const Center(
            child: Text(
              'CONVERT',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

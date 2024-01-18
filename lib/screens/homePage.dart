import 'package:currency_converter_app/widgets/convertButton.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/currencyProvider.dart';
import '../widgets/textFormFieldWidget.dart';
import '../widgets/titleWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //created controller for amount
  final TextEditingController _amountController = TextEditingController();

  //created map for from currency
  Map fromCountry = {
    'code': 'AZN',
    'name': 'Azerbaijan Manat',
    'symbol': '₼',
  };

  //created map for to currency
  Map toCountry = {
    'code': 'USD',
    'name': 'United States Dollar',
    'symbol': '\$'
  };

  //dispose controller
  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10.0),
              TextFormFieldWidget(
                controller: _amountController,
                hintText: 'Enter amount',
              ),
              const SizedBox(height: 10.0),
              const TitleWidget(text: 'From'),
              selectFromCurrency(context),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      final temp = fromCountry;
                      fromCountry = toCountry;
                      toCountry = temp;
                    });
                  },
                  icon: const Icon(
                    Icons.currency_exchange_rounded,
                    size: 30,
                  ),
                ),
              ),
              const TitleWidget(text: 'To'),
              selectToCurrency(context),
              const SizedBox(height: 10.0),
              ConvertButton(
                fromCurrency: fromCountry['code'],
                toCurrency: toCountry['code'],
              ),
              const SizedBox(height: 10.0),
              const TitleWidget(text: 'Result'),
              showResult(context),
            ],
          ),
        ),
      ),
    );
  }

  //select from currency
  GestureDetector selectFromCurrency(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCurrencyPicker(
          context: context,
          showFlag: true,
          showCurrencyName: true,
          showCurrencyCode: true,
          onSelect: (Currency currency) {
            debugPrint('from Country: ${currency.code}');
            setState(() {
              fromCountry['code'] = currency.code;
              fromCountry['name'] = currency.name;
              fromCountry['symbol'] = currency.symbol;
            });
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          tileColor: Colors.grey.shade200,
          leading: CircleAvatar(
            backgroundColor: Colors.grey.shade300,
            child: fromCountry['symbol'] == null
                ? const Text('₼')
                : Text(fromCountry['symbol']),
          ),
          title: fromCountry['code'] == null
              ? const Text('AZN')
              : Text(fromCountry['code']),
          subtitle: fromCountry['name'] == null
              ? const Text('Azerbaijan Manat')
              : Text(
                  fromCountry['name'],
                ),
          trailing: const Icon(Icons.arrow_drop_down),
        ),
      ),
    );
  }

  //show result of convert
  Padding showResult(BuildContext context) {
    var result = 0.0;

    try {
      double currencyValue = context.watch<CurrencyProvider>().value;
      double amount = double.parse(_amountController.text);
      result = amount * currencyValue;
    } catch (e) {
      print(e);
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 15.0,
        ),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${_amountController.text} ${fromCountry['symbol']} = '),
            Text('$result ${toCountry['symbol']}')
          ],
        ),
      ),
    );
  }

  //select to currency
  GestureDetector selectToCurrency(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCurrencyPicker(
          context: context,
          showFlag: true,
          showCurrencyName: true,
          showCurrencyCode: true,
          onSelect: (Currency currency) {
            setState(() {
              toCountry['code'] = currency.code;
              toCountry['name'] = currency.name;
              toCountry['symbol'] = currency.symbol;
            });
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          tileColor: Colors.grey.shade200,
          leading: CircleAvatar(
            backgroundColor: Colors.grey.shade300,
            child: fromCountry['symbol'] == null
                ? const Text('\$')
                : Text(fromCountry['symbol']),
          ),
          title: toCountry['code'] == null
              ? const Text('USD')
              : Text(toCountry['code']),
          subtitle: toCountry['name'] == null
              ? const Text('United States Dollar')
              : Text(toCountry['name']),
          trailing: const Icon(Icons.arrow_drop_down),
        ),
      ),
    );
  }
}

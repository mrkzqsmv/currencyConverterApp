import 'package:flutter/material.dart';

import '../widgets/textFormFieldWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Currency'),
              Text('Converter'),
              TextFormFieldWidget(),
              TextFormFieldWidget(),
              Row(
                children: [
                  Text('From'),
                  Text('To'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


//currency api
//https://api.currencyapi.com/v3/latest?apikey=cur_live_nIKlPjSl9HQ2RcqM0lVqfNyxOx2qjn8Akz83lTQM&base_currency=EUR&currencies=AZN

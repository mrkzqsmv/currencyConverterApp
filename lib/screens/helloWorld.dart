import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/currencyProvider.dart';

class Name extends StatefulWidget {
  const Name({super.key});

  @override
  State<Name> createState() => _NameState();
}

class _NameState extends State<Name> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, CurrencyApi currencyApi, child) {
        return Text(currencyApi.name);
      },
    );
  }
}
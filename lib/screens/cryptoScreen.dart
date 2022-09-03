import 'package:cryptotracker/models/BigData.dart';
import 'package:cryptotracker/repository/repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/CurrencyList.dart';

class CryptoScreen extends StatefulWidget {
  const CryptoScreen({Key? key}) : super(key: key);

  @override
  State<CryptoScreen> createState() => _CryptoScreenState();
}

class _CryptoScreenState extends State<CryptoScreen> {
  @override
  late Future<BigData> _coins;
  late Repository repo;

  @override
  void initState() {
    // TODO: implement initState
    repo = Repository();
    _coins = repo.getCoins();
    print(_coins);
    super.initState();
  }

  Widget build(BuildContext context) {
    return FutureBuilder<BigData>(
        future: _coins,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              var currencyData = snapshot.data!.dataModel;
              return CurrencyList(currency: currencyData);
            } else if (snapshot.hasError) {
              return Center(
                child: Text("${snapshot.error}"),
              );
            }
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}

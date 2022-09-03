import 'package:cryptotracker/screens/screenHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _index = 0;
  static const List<Widget> _screens = [
    CryptoScreen(),
    DashScreen(),
    PersonScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_index],
      backgroundColor: Color.fromARGB(255, 6, 7, 34),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.stairs,
              ),
              label: "crypto"),
          BottomNavigationBarItem(
              icon: Icon(Icons.flutter_dash), label: "dash"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "account"),
        ],
        currentIndex: _index,
        selectedItemColor: Colors.amber[800],
        onTap: _itemTapFunction,
      ),
    );
  }

  void _itemTapFunction(int value) {
    setState(() {
      _index = value;
    });
  }
}

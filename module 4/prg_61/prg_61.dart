import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mod_4/prg_61/cartscreen.dart';
import 'package:mod_4/prg_61/foodscreen.dart';

class Screen1 extends StatefulWidget
{
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1>
{
  int _selectedIndex = 0;

  List<Widget> Screens = <Widget>[
    Foodscreen(),
    CartScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      body: Screens[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            label: 'Food',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart_sharp),
            label: 'Cart',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),

    );
  }
}

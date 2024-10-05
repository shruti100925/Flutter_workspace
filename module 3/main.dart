import 'package:flutter/material.dart';
import 'package:mod_3/prg_49.dart';
import 'package:mod_3/prg_49_2.dart';
import 'package:mod_3/prg_50.dart';
import 'package:mod_3/prg_51.dart';
import 'package:mod_3/prg_52.dart';
import 'package:mod_3/prg_53.dart';
import 'package:mod_3/prg_54.dart';
import 'package:mod_3/prg_55.dart';
import 'package:mod_3/prg_56.dart';
import 'package:mod_3/prg_57.dart';
import 'package:mod_3/prg_58.dart';
import 'package:mod_3/prg_59.dart';
import 'package:mod_3/prg_60.1.dart';
import 'package:mod_3/prg_60.2.dart';

void main()
{
  runApp(const MaterialApp(home:MyApp(),debugShowCheckedModeBanner: false,),);
}

class MyApp extends StatefulWidget
{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title:Text("Module_3"),),
      body: SingleChildScrollView
        (
        child: Column
          (
          children:
          [
            ElevatedButton(onPressed: ()
            {
              Navigator.push(context,MaterialPageRoute(builder: (context) => Screen49() ));

            }, child: Text("Prg_49")),

            ElevatedButton(onPressed: ()
            {
              Navigator.push(context,MaterialPageRoute(builder: (context) => Screen49_2() ));

            }, child: Text("Prg_49_Screen2")),

            ElevatedButton(onPressed: ()
            {
              Navigator.push(context,MaterialPageRoute(builder: (context) => Reversenum() ));

            }, child: Text("Prg 50")
            ),

            ElevatedButton(onPressed: ()
            {
              Navigator.push(context,MaterialPageRoute(builder: (context) => betweennum() ));

            }, child: Text("Prg 51")
            ),

            ElevatedButton(onPressed: ()
            {
              Navigator.push(context,MaterialPageRoute(builder: (context) => radiobutton() ));

            }, child: Text("Prg 52")
            ),

            ElevatedButton(onPressed: ()
            {
              Navigator.push(context,MaterialPageRoute(builder: (context) => BackgroundChanger() ));

            }, child: Text("Prg 53")
            ),
            ElevatedButton(onPressed: ()
            {
              Navigator.push(context,MaterialPageRoute(builder: (context) => FontSizeScreen() ));

            }, child: Text("Prg 54")
            ),
            ElevatedButton(onPressed: ()
            {
              Navigator.push(context,MaterialPageRoute(builder: (context) => checkboxex() ));

            }, child: Text("Prg 55")
            ),
            ElevatedButton(onPressed: ()
            {
              Navigator.push(context,MaterialPageRoute(builder: (context) => Textviewaroundimages() ));

            }, child: Text("Prg 56")
            ),
            ElevatedButton(onPressed: ()
            {
              Navigator.push(context,MaterialPageRoute(builder: (context) => Colorscreenselect() ));

            }, child: Text("Prg 57")
            ),
            ElevatedButton(onPressed: ()
            {
              Navigator.push(context,MaterialPageRoute(builder: (context) => Seekbarex() ));

            }, child: Text("Prg 58")
            ),
            ElevatedButton(onPressed: ()
            {
              Navigator.push(context,MaterialPageRoute(builder: (context) => LoginScreen() ));

            }, child: Text("Prg 59")
            ),
            ElevatedButton(onPressed: ()
            {
              Navigator.push(context,MaterialPageRoute(builder: (context) => RestaurantScreen() ));

            }, child: Text("Prg 60_1")
            ),
            ElevatedButton(onPressed: ()
            {
              Navigator.push(context,MaterialPageRoute(builder: (context) => FoodDetailsScreen() ));

            }, child: Text("Prg 60_2")
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mod_4/prg_61/prg_61.dart';
import 'package:mod_4/prg_62.dart';
import 'package:mod_4/prg_63.dart';
import 'package:mod_4/prg_64.dart';
import 'package:mod_4/prg_65.dart';
import 'package:mod_4/prg_66.dart';
import 'package:mod_4/prg_67.dart';
import 'package:mod_4/prg_68.dart';
import 'package:mod_4/prg_69/home.dart';
import 'package:mod_4/prg_70.dart';
import 'package:mod_4/prg_71.dart';
import 'package:mod_4/prg_72.dart';
import 'package:mod_4/prg_73.dart';
import 'package:mod_4/prg_74.dart';
import 'package:mod_4/prg_76/FirstScreen.dart';
import 'package:mod_4/prg_77.dart';
import 'package:mod_4/prg_78.dart';

void main()
{
  runApp(MaterialApp(home: MyApp(),));
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
        body: SingleChildScrollView
          (
            child: Column
              (
                  children:
                  [
                    AppBar(
                      title: Text("Module_4"),
                    ),
                    ElevatedButton(onPressed: ()
                        {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Screen1()));
                        }, child: Text("Prg_61")),


                    ElevatedButton(onPressed: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Myhomepage()));
                    }, child: Text("Prg_62")),


                    ElevatedButton(onPressed: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> AlertScren63()));
                    }, child: Text("63 Alert Button with-Positive,Negative,neutral"),),

                    SizedBox(height: 20,),
                    ElevatedButton(onPressed: ()
                    {

                      Navigator.push(context, MaterialPageRoute(builder: (context)=> CitySelector()));
                    }, child: Text("63 Alert Button With List of City "),),

                    SizedBox(height: 20,),
                    ElevatedButton(onPressed: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> MyHomePage()));
                    }, child: Text("65 Alert Button With Exit"),),

                    SizedBox(height: 20,),
                    ElevatedButton(onPressed: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> DatePickerExample()));
                    }, child: Text("66 Date"),),

                    SizedBox(height: 20,),
                    ElevatedButton(onPressed: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> SeeProfile()));
                    }, child: Text("67 Profile and Logout Option"),),

                    SizedBox(height: 20,),
                    ElevatedButton(onPressed: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ContextMenu()));
                    }, child: Text("68 Context Menu"),),

                    SizedBox(height: 20,),
                    ElevatedButton(onPressed: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Gmailsecreenex ()));
                    }, child: Text("69 Gmail"),),

                    SizedBox(height: 20,),
                    ElevatedButton(onPressed: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> BottomGalleryex()));
                    }, child: Text("70 Bottom Gallery"),),

                    SizedBox(height: 20,),
                    ElevatedButton(onPressed: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> NavigatorDrawerEx()));
                    }, child: Text("71 Navigator Drawer Gallery"),),

                    SizedBox(height: 20,),
                    ElevatedButton(onPressed: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> phonecall()));
                    }, child: Text("72 Phone Call App"),),

                    SizedBox(height: 20,),
                    ElevatedButton(onPressed: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> SplashScreen()));
                    }, child: Text("73 Splash Screen"),),

                    SizedBox(height: 20,),
                    ElevatedButton(onPressed: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Screen3()));
                    }, child: Text("74 Redirect User"),),

                    SizedBox(height: 20,),
                    ElevatedButton(onPressed: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Firstscreen()));
                    }, child: Text("76 Summation Program"),),

                    SizedBox(height: 20,),
                    ElevatedButton(onPressed: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Call_Sms()));
                    }, child: Text("77 Call Sms"),),

                    SizedBox(height: 20,),
                    ElevatedButton(onPressed: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                    }, child: Text("78 Crud Operation"),),
                  ],
              ),
          ),
      );
  }
}


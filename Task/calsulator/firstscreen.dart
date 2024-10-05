import 'dart:convert';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertask/result.dart';

class firstscreen extends StatelessWidget

{
  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();


  Widget build(BuildContext context)
  {
    return Scaffold
      (

         appBar: AppBar(title: Text("First Screen"),),
         body: Center
           (
             child: Column
               (
                  children:
                  [

                     TextField(controller: num1, decoration: InputDecoration(hintText: "Enter number"), ),
                     SizedBox(height: 10),
                     TextField(controller: num2, decoration: InputDecoration(hintText: "Enter number"), ),
                    SizedBox(height: 10),
                    
                    ElevatedButton(onPressed: ()
                      {
                        int add=int.parse(num1.text)+int.parse(num2.text);
                        var data = add.toString();

                        Navigator.push(context,MaterialPageRoute(builder: (context)=>result(n:data)));
                      }, child: Text("Addition")),

                    SizedBox(height: 10),

                    ElevatedButton(onPressed: ()
                    {
                      int add=int.parse(num1.text)-int.parse(num2.text);
                      var data = add.toString();

                      Navigator.push(context,MaterialPageRoute(builder: (context)=>result(n:data)));
                    }, child: Text("Subtraction")),

                    SizedBox(height: 10),

                    ElevatedButton(onPressed: ()
                    {
                      int add=int.parse(num1.text)*int.parse(num2.text);
                      var data = add.toString();

                      Navigator.push(context,MaterialPageRoute(builder: (context)=>result(n:data)));
                    }, child: Text("Multiplication")),

                    SizedBox(height: 10),

                    ElevatedButton(onPressed: ()
                    {
                      int add=int.parse(num1.text)~/int.parse(num2.text);
                      var data = add.toString();

                      Navigator.push(context,MaterialPageRoute(builder: (context)=>result(n:data)));
                    }, child: Text("Division")),



                  ],
             ),
      ));

  }

}
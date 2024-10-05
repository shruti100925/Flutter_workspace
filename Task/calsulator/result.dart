import 'dart:ffi';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertask/firstscreen.dart';

class result extends StatelessWidget
{

  String n;
  result({required this.n});

  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar(title: Text("Result"),),
        body: Center
          (
            child: Column
              (
                children:
                [
                  Text("Answer is $n"),
                ],
            ),
        ),
      );

  }

}
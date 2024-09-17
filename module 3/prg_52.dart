
import 'package:flutter/material.dart';

class radiobutton extends StatefulWidget {
  const radiobutton({super.key});

  @override
  State<radiobutton> createState() => _radiobuttonState();
}
enum Op { add, subtract, multiply, divide }

class _radiobuttonState extends State<radiobutton>
{
  double? num1, num2;

  String result = " ";

  Op selectoperation = Op.add;

  @override
  Widget build(BuildContext context) {



    return Scaffold
      (
      appBar: AppBar(title: Text("Calculator App",),
        backgroundColor: Colors.blue,
        centerTitle: true,),
      body: SingleChildScrollView
        (
        child: Center(

          child: Column(

            children:
            [
              SizedBox(height: 30,),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter First Number',
                  hintText: "First Number",
                  border: OutlineInputBorder(),
                ),

                onChanged: (value) {
                  setState(() {
                    num1 = double.tryParse(value)!;
                  });
                },
              ),

              SizedBox(height: 20,),

              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter Second Number',
                  hintText: "Second Number",
                  border: OutlineInputBorder(),
                ),

                onChanged: (value) {
                  setState(() {
                    num2 = double.tryParse(value)!;
                  });
                },

              ),

              SizedBox(height: 20,),

              RadioListTile<Op>(
                title: const Text('Add'),
                value: Op.add,
                groupValue: selectoperation,
                onChanged: (Op? value) {
                  setState(() {
                    selectoperation = value!;
                  });
                },
              ),

              RadioListTile<Op>(
                title: const Text('Subtract'),
                value: Op.subtract,
                groupValue: selectoperation,
                onChanged: (Op? value) {
                  setState(() {
                    selectoperation = value!;
                  });
                },
              ),

              RadioListTile<Op>(
                title: const Text('Multiply'),
                value: Op.multiply,
                groupValue: selectoperation,
                onChanged: (Op? value) {
                  setState(() {
                    selectoperation = value!;
                  });
                },
              ),

              RadioListTile<Op>(
                title: const Text('Divide'),
                value: Op.divide,
                groupValue: selectoperation,
                onChanged: (Op? value) {
                  setState(() {
                    selectoperation = value!;
                  });
                },
              ),

              SizedBox(height: 20),
              ElevatedButton(
                onPressed: calculateResult,
                child: Text('Calculate'),
              ),
              SizedBox(height: 20),
              Text(
                'Result: $result',
                style: TextStyle(fontSize: 24),
              ),


            ],
          ),
        ),
      ),
    );
  }

void calculateResult()
{
  if (num1 == null || num2 == null) {
    setState(() {
      result = 'Please enter both numbers';
    });
    return;
  }
  double calcResult;

  switch (selectoperation) {
    case Op.add:
      calcResult = num1! + num2!;
      break;
    case Op.subtract:
      calcResult = num1! - num2!;
      break;
    case Op.multiply:
      calcResult = num1! * num2!;
      break;
    case Op.divide:
      if (num2 == 0) {
        setState(() {
          result = 'Cannot divide by zero';
        });
        return;
      }
      calcResult = num1! / num2!;
      break;
  }
  setState(() {
    result = calcResult.toString();
  });
}
}
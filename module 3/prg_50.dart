
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Reversenum extends StatefulWidget
{
  const Reversenum({super.key});

  @override
  State<Reversenum> createState() => _ReversenumState();
}

class _ReversenumState extends State<Reversenum>
{
  TextEditingController _inputController = TextEditingController();
  TextEditingController _outputController = TextEditingController();

  void _reverseNumber()
  {
    final input = _inputController.text;

    if (input.isNotEmpty)
    {
      final reversed = input.split('').reversed.join('');
      _outputController.text = reversed;
    }
    else
    {
      _outputController.text = 'Please enter a number';
    }
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar(title: Text('Reverse Number App'),),
        body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column
          (
            children:
            [
                 TextField
                   (
                      controller: _inputController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                      labelText: 'Enter a number',
                      border: OutlineInputBorder(),
                     ),
                   ),
                SizedBox(height: 16),

                ElevatedButton(
                onPressed: _reverseNumber,
                child: Text('Reverse Number'),
                ),

                SizedBox(height: 16),


                TextField(
                controller: _outputController,
                readOnly: true,
                decoration: InputDecoration(
                labelText: 'Reversed number',
                border: OutlineInputBorder(),
                ),
                ),
    ],
    ),
    ),
    );
  }
}

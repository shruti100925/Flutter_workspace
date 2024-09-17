import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class betweennum extends StatefulWidget
{
  const betweennum({super.key});

  @override
  State<betweennum> createState() => _betweennumState();
}

class _betweennumState extends State<betweennum>
{

  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();

  void _navigateToDisplayScreen() {
    final int number1 = int.tryParse(_controller1.text) ?? 0;
    final int number2 = int.tryParse(_controller2.text) ?? 0;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DisplayScreen(
          number1: number1,
          number2: number2,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
          appBar: AppBar(title: Text('Enter Numbers'),),
          body: Padding
            (
                padding: const EdgeInsets.all(16.0),
                child: Column
                  (
                    children:
                    [
                      TextField(
                        controller: _controller1,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Enter first number',
                        ),
                      ),
                      TextField(
                        controller: _controller2,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Enter second number',
                        ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _navigateToDisplayScreen,
              child: Text('Show Numbers'),
            ),
          ],
        ),
      ),
    );
  }
}
class DisplayScreen extends StatelessWidget
{
  final int number1;
  final int number2;

  DisplayScreen({required this.number1, required this.number2});

  @override
  Widget build(BuildContext context)
  {
    final List<int> numbers = List.generate
      (
      (number2 - number1).abs() + 1,
          (index) => number1 + index,
    );

    return Scaffold
      (
        appBar: AppBar(title: Text('Numbers Between'),),
        body: Padding
          (
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
            itemCount: numbers.length,
            itemBuilder: (context, index)
            {
              return ListTile
                (
                  title: Text(numbers[index].toString()),
                );
            },
          ),
      ),
    );
  }
}
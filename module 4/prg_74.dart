import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      backgroundColor: Colors.pink,
      appBar: AppBar(
        title: const Text('First Screen'),
        // automaticallyImplyLeading: true,
      ),
      body: Center(

        child: Column(

          children: [

            SizedBox(height: 250,),

            const Text(
              "Welcome to First Screen",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, wordSpacing: 5.0),
            ),

            const SizedBox(height: 20,),

            ElevatedButton(onPressed: ()
            {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Screen2()));

            }, child: Text("Go to Second Screen",style: TextStyle(fontWeight: FontWeight.bold),),)
          ],
        ),
      ),

    );
  }
}


class Screen2 extends StatefulWidget
{
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold
      (
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: const Text('Second Screen'),
        automaticallyImplyLeading: true,
      ),
      body: Center(


        child: Column(

          children: [

            SizedBox(height: 250,),


            const Text(
              "Welcome to Second Screen",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, wordSpacing: 5.0),
            ),

            const SizedBox(height: 20,),

            ElevatedButton(onPressed: ()
            {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Screen3()));

            }, child: Text("Go to previous page",style: TextStyle(fontWeight: FontWeight.bold),),)
          ],
        ),
      ),
    );
  }
}

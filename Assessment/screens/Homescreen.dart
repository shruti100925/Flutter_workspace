import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test2/screens/quiz.dart';

import '../login-register/Logincard.dart';
import 'Aboutus.dart';
import 'Readques.dart';
import 'contactus.dart';

class Homescreen extends StatefulWidget
{
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  late SharedPreferences sharedPreferences;
  String email = ""; // Default email for testing

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      email =
          sharedPreferences.getString('email') ?? email; // Retrieve the email
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      appBar: AppBar
        (
        title: Text("ECORP"),
        actions: [
          IconButton(
            onPressed: () {
              _showLogoutConfirmationDialog();
            },
            icon: Icon(Icons.logout),
          )
        ],
      ),

      body: Stack
        (
        children: <Widget>[
          Text(
            "Welcome, $email",
            style: const TextStyle(
              fontSize: 25,
              color: Colors.red,
              fontWeight: FontWeight.bold,

            ),),


          Container(

            margin: EdgeInsets.only(top: 100),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: GridView.count(
                crossAxisCount: 2,
                children: <Widget>
                [
                  createGridItem(0),
                  createGridItem(1),
                  createGridItem(2),
                  createGridItem(3),

                ],
              ),
            ),
          )


        ],
      ),
    );
  }

  Widget createGridItem(int position)
  {
    Color? color = Colors.white;
    var icondata = Icons.add;
    String label = "Add";
    switch (position) {
      case 0:
        color = Colors.cyan;
        icondata = Icons.supervisor_account_sharp;
        label = "About Us";

        break;
      case 1:
        color = Colors.deepPurple;
        icondata = Icons.phone;
        label = "Contact Us";
        break;
      case 2:
        color = Colors.orange[300];
        icondata = Icons.library_books;
        label = "Play Quiz";
        break;
      case 3:
        color = Colors.pinkAccent;
        icondata = Icons.access_time;
        label = "Read Questions";
        break;

    }


      return Padding
        (

          padding:
          const EdgeInsets.only(left: 10.0, right: 10, bottom: 5, top: 5),
          child: Card
            (
          elevation: 10,
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            side: BorderSide(color: Colors.white),
          ),
          child: InkWell(
            onTap:() {
              switch (position) {
                case 0:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Aboutus(),
                    ),
                  );
                  break;

                case 1:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContactUs(),
                    ),
                  );
                  break;
                case 2:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizApp(),
                    ),
                  );
                  break;
                case 3:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReadQuestionsScreen(),
                    ),
                  );
                  break;
                default:
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Selected Item $position")),
                  );
                  break;
              }
            },/*{
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Selected Item $position")));
            },*/
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    icondata,
                    size: 40,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      label,
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );

    ;
  }


  void _showLogoutConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [
                Colors.purple.shade100,
                Colors.blue.shade100,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.logout,
                color: Colors.redAccent,
                size: 60,
              ),
              const SizedBox(height: 16),
              Text(
                "Logout Confirmation",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Are you sure you want to log out?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {

                      sharedPreferences.setBool('mylogin', false);
                      Navigator.of(context).pop();
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (context) => Logincard()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Logout",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

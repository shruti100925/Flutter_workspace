import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../db.dart';
import '../screens/Homescreen.dart';
import 'Signupcard.dart';

class Logincard extends StatefulWidget

{
  const Logincard({super.key});

  @override
  State<Logincard> createState() => _LogincardState();
}

class _LogincardState extends State<Logincard>
{
  TextEditingController cemail = TextEditingController();
  TextEditingController cpass = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  late SharedPreferences sharedPreferences;
  Dbhelper dbHelper = Dbhelper.instance;

  @override
  void initState() {
    // TODO: implement initState
    checklogin();
  }
  void checklogin() async
  {
    sharedPreferences = await SharedPreferences.getInstance();
    bool newuser = (sharedPreferences.getBool('mylogin') ?? false);

    if (newuser)
    {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Homescreen()),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      backgroundColor: Colors.blue,

      body: SingleChildScrollView(


        child: Container
          (

          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors:
              [
                Colors.blue,
                Colors.blue,
              ],
              begin: Alignment.topLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Column
            (
            children:
            [
              SizedBox(
                height: 150,
              ),
              Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 42.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "Enter a Beautiful Place",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Card(
                margin: EdgeInsets.all(20.0),
                child: Padding(
                  padding: EdgeInsets.all(16.0),

                  child: Form(
                    key: formGlobalKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>
                      [
                        TextFormField
                          (
                          controller: cemail,
                          decoration: InputDecoration(labelText: 'Email'),
                          validator: (value) {
                            if (value == null || value.isEmpty)
                            {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),


                        SizedBox(height: 10),

                        TextFormField
                          (
                          controller: cpass,
                          decoration: InputDecoration(labelText: 'Password'),
                          validator: (value) {
                            if (value == null || value.isEmpty)
                            {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          obscureText: true,
                        ),
                        SizedBox(height: 20),

                        ElevatedButton
                          (
                          onPressed: ()  async
                          {
                            if (formGlobalKey.currentState!.validate())
                            {
                              String email = cemail.text.toString();
                              String password = cpass.text.toString();

                              // Check user credentials in SQLite
                              Map<String, dynamic>? user = await dbHelper.getUser(email);

                              if (user != null && user['pass'] == password)
                              {
                                sharedPreferences = await SharedPreferences.getInstance();
                                sharedPreferences.setBool('mylogin', true);
                                sharedPreferences.setString('email', email);

                                Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) => Homescreen()),);
                              }
                              else
                              {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text('Invalid email or password!'),
                                ));
                              }
                            }
                          },

                          child: Text('Login', style: TextStyle(color: Colors.blueAccent),),
                        ),
                        _forgotPassword(context),
                        _signup(context),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _forgotPassword(context)
  {
    return TextButton(
      onPressed: () {},
      child: const Text(
        "Forgot password?",
        style: TextStyle(color: Colors.blue),
      ),
    );
  }

  _signup(context)
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account? "),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Signupcard()),
            );
          },
          child: const Text(
            "Sign Up",
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}

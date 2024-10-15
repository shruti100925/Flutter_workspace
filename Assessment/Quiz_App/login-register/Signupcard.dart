import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../db.dart';
import 'Logincard.dart';


class Signupcard extends StatefulWidget
{
  const Signupcard({super.key});

  @override
  State<Signupcard> createState() => _SignupcardState();
}

class _SignupcardState extends State<Signupcard>
{
  Dbhelper dbHelper = Dbhelper.instance;
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController repass = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context)
  {

    return Scaffold
      (
      backgroundColor: Colors.blue,
      body: SingleChildScrollView
        (

        child: Container
          (
          /* constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height,
          ),*/
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
                height: 100,
              ),

              Text(
                "Register",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 42.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),

              Card
                (
                margin: EdgeInsets.all(20.0),

                child: Padding
                  (
                  padding: EdgeInsets.all(16.0),

                  child:Form
                    (
                    key: formGlobalKey,
                    child: Column
                      (
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>
                      [

                        TextFormField(controller: fname,
                          validator: (value)
                          {
                            if (value == null || value.isEmpty)
                            {
                              return 'Enter First Name';
                            }
                            return null;
                          },
                          decoration: InputDecoration(labelText: 'First Name'),

                        ),
                        SizedBox(height: 10),
                        TextFormField(controller: lname,
                          validator: (value)
                          {
                            if (value == null || value.isEmpty)
                            {
                              return 'Enter Last Name';
                            }
                            return null;
                          },
                          decoration: InputDecoration(labelText: 'Last Name'),

                        ),
                        SizedBox(height: 10),
                        TextFormField(controller: email,
                            decoration: InputDecoration(labelText: 'Email'),
                            validator: (value)
                            {
                              if (value!.isEmpty)
                              {
                                return 'Please enter your name';
                              };
                              if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value!))
                              {
                                return 'Please enter only text';
                              };
                            }
                        ),
                        SizedBox(height: 10),
                        TextFormField(controller: pass,
                          decoration: InputDecoration(labelText: 'Password'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            }
                            /*if (value.length < 6) {
                                  return 'Password must be at least 6 characters long';
                                }*/
                            return null;
                          },
                          obscureText: true,
                        ),
                        SizedBox(height: 20),
                        TextFormField(controller: repass,
                          decoration: InputDecoration(labelText: 'Confirm password'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            }
                            if (value != pass.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                          obscureText: true,
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: ()
                          {

                            if (formGlobalKey.currentState!.validate())
                            {
                              insert();

                              Fluttertoast.showToast
                                (
                                  msg: "Signup Successful",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                            }
                          },
                          child: Text('Signup', style: TextStyle(color: Colors.blue), ),

                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text("Already have an account?"),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Logincard()),
                                );
                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(color: Colors.blueAccent),
                              ),
                            )
                          ],
                        ),
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

  Future<void> insert() async
  {
    Map<String,dynamic>row=
    {
      Dbhelper.cfname : fname.text.toString(),
      Dbhelper.clname : lname.text.toString(),
      Dbhelper.cemail : email.text.toString(),
      Dbhelper.cpass : pass.text.toString(),
      Dbhelper.crepass : repass.text.toString()
    };

    print('insert stRT');

    final id = await dbHelper.insert(row);
    print("$row");
    print('inserted row id: $id');
    fname.text = "";
    lname.text = "";
    email.text = "";
    pass.text = "";
    repass.text = "";
  }
}

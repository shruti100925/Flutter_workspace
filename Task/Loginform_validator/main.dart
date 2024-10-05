import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task/main.dart';

void main()
{
  runApp(const MaterialApp(home: Myapp(),));
}

class Myapp extends StatefulWidget
{
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp>
{

  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController cpass = TextEditingController();
  final mykey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: const Text("Registration Form"),backgroundColor: Colors.blueAccent,),
      body:  SingleChildScrollView
        (
        child: Form(



            key: mykey,
            child: Column
              (
                children:
                [
                  SizedBox(height: 10,),

                  TextFormField
                    (
                    controller:fname,
                    decoration: InputDecoration
                      (
                      hintText: "Enter Your FirstName",
                      enabledBorder: OutlineInputBorder
                        (
                        borderSide: const BorderSide(color: Colors.lightBlue),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder
                        (
                        borderSide: const BorderSide(
                          color: Colors.lightBlueAccent,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      errorBorder: OutlineInputBorder
                        (
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),

                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
                    ],
                    validator: (value)
                    {
                      if (value!.isEmpty)
                      {
                        return 'Enter Your Firstname';
                      }
                      return null;
                    },
                  ),




                  SizedBox(height: 5,),

                  TextFormField
                    (
                    controller:lname,
                    decoration: InputDecoration
                      (
                      hintText: "Enter Your Lastname",
                      enabledBorder: OutlineInputBorder
                        (
                        borderSide: const BorderSide(color: Colors.lightBlue),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder
                        (
                        borderSide: const BorderSide(
                          color: Colors.lightBlueAccent,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      errorBorder: OutlineInputBorder
                        (
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),

                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
                    ],
                    validator: (value)
                    {

                      if (value!.isEmpty)
                      {
                        return 'Enter Your Lastname';
                      }
                      return null;
                    },

                  ),


                  SizedBox(height: 5,),

                  TextFormField
                    (
                    controller:email,
                    decoration: InputDecoration
                      (
                      hintText: "Enter Your Email",
                      enabledBorder: OutlineInputBorder
                        (
                        borderSide: const BorderSide(color: Colors.lightBlue),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder
                        (
                        borderSide: const BorderSide(
                          color: Colors.lightBlueAccent,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      errorBorder: OutlineInputBorder
                        (
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),

                    ),
                    validator: (value)
                    {
                      final RegExp regex = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
                      if (value!.isEmpty)
                      {
                        return 'Enter Detail';
                      }
                      else if(!regex.hasMatch(value))
                      {
                        return 'Please enter valid Email';
                      }
                      return null;
                    },

                  ),


                  SizedBox(height: 5,),

                  TextFormField
                    (
                    controller:number,
                    decoration: InputDecoration
                      (

                      hintText: "Enter Your Phone number",
                      enabledBorder: OutlineInputBorder
                        (
                        borderSide: const BorderSide(color: Colors.lightBlue),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder
                        (
                        borderSide: const BorderSide(
                          color: Colors.lightBlueAccent,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      errorBorder: OutlineInputBorder
                        (
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),

                    ),

                    keyboardType: TextInputType.number,
                    inputFormatters:
                    [
                      FilteringTextInputFormatter.digitsOnly,
                    ],

                    validator: (value)
                    {
                      final RegExp regex = RegExp(r"^[0-9]");
                      if (value!.isEmpty)
                      {
                        return 'Please Enter Detail';
                      }
                      else if(!regex.hasMatch(value))
                      {
                        return 'Please Enter Number Only';
                      }
                      else if(value.length != 10)
                      {
                        return "Please Enter 10 digits Only";
                      }
                      return null;
                    },


                  ),

                  SizedBox(height: 5,),

                  TextFormField
                    (
                    controller:pass,
                    obscureText: true,
                    decoration: InputDecoration
                      (
                      hintText: "Password",
                      enabledBorder: OutlineInputBorder
                        (
                        borderSide: const BorderSide(color: Colors.lightBlue),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder
                        (
                        borderSide: const BorderSide(
                          color: Colors.lightBlueAccent,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      errorBorder: OutlineInputBorder
                        (
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),

                    ),

                    validator: (value)
                    {
                      final RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                      if (value == null || value!.isEmpty)
                      {
                        return 'Enter Paasword';
                      }
                      else if(!regex.hasMatch(value))
                      {
                        return 'Please enter valid Password';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 5,),

                  TextFormField
                    (
                      controller:cpass,
                      obscureText: true,
                      decoration: InputDecoration
                        (
                        hintText: "Confirm Password",
                        enabledBorder: OutlineInputBorder
                          (
                          borderSide: const BorderSide(color: Colors.lightBlue),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder
                          (
                          borderSide: const BorderSide(
                            color: Colors.lightBlueAccent,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        errorBorder: OutlineInputBorder
                          (
                          borderSide: const BorderSide(
                            color: Colors.red,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),

                      ),

                      /* validator: (value)
                          {
                            final RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                            if (value == null || value!.isEmpty)
                            {
                              return 'Enter Comfirm Paasword';
                            }
                            else if(!regex.hasMatch(value))
                            {
                              return 'Please enter valid Password';
                            }
                            return null;
                          },*/
                      validator: (value)
                      {
                        // final RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                        if(cpass.text != pass.text)
                        {
                          return "Password not Same";
                        };
                        if (value!.isEmpty)
                        {
                          return 'Enter Comfirm Paasword';
                        }
                        return null;
                      }

                  ),

                  SizedBox(height: 30,),

                  ElevatedButton(onPressed: ()
                  {
                    if(mykey.currentState!.validate())
                    {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Signup Sucessfully")));
                    }

                  },child: Text("Login"),style:ElevatedButton.styleFrom(backgroundColor: Colors.blue,foregroundColor: Colors.white),),
                ]

            )

        ),
      ),
    );


  }
}
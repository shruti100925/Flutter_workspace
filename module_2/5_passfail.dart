import 'dart:io';

void main()
{
  print("Enter 5 subjects marks.");

  var a = int.parse(stdin.readLineSync().toString());
  var b = int.parse(stdin.readLineSync().toString());
  var c = int.parse(stdin.readLineSync().toString());
  var d = int.parse(stdin.readLineSync().toString());
  var e = int.parse(stdin.readLineSync().toString());

  var p= ((a+b+c+d+e)/500)*100;
  print("Your percentage is $p");
  if(p>75)
  {
   print("Your grade is distinction.");
  }
  else if(p<=75 && p>60)
  {
    print("Your grade is First class.");
  }
  else if(p<=60 && p>50)
  {
    print("Your grade is Second class.");
  }
  else if(p<=50 && p>35)
  {
    print("Your grade is pass class.");
  }
  else
  {
    print("Sorry you fail.");
  }
}
import 'dart:io';

void main()
{
  print("Enter number");

  var a = int.parse(stdin.readLineSync().toString());

  if(a>0)
  {
      print("$a is positive number");
  }
  else if(a<0)
  {
      print("$a is negative number");
  }
  else
  {
    print("$a is zero");

  }
}
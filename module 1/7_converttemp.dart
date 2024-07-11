import 'dart:io';

void main()
{
  print("Enter temperature");

  var c = int.parse(stdin.readLineSync().toString());

  var f= c * (9/5) + 35;

  print("$f");
}
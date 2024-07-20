import 'dart:io';

void main()
{
  var fact=1;
  print("Enter number:");
  var n = int.parse(stdin.readLineSync().toString());


  for (int i = 1; i <= n; ++i) 
  {
    fact *= i;
  }
  print("$fact");
}

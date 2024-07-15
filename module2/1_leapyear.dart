import 'dart:io';

void main()
{
  print("Enter year");

  var y = int.parse(stdin.readLineSync().toString());

  if ((y % 4 == 0 && y % 100 != 0) || (y % 400 == 0))
  {
     print("$y Is a leap year");
  }
  else
  {
    print("$y Is not a leap year");
  }
}
import 'dart:io';

void main()
{
  print("Enter 3 numbers");

  var a = int.parse(stdin.readLineSync().toString());
  var b = int.parse(stdin.readLineSync().toString());
  var c = int.parse(stdin.readLineSync().toString());

  if(a>b)
  {
    if(a>c)
      {
        print("$a is the largest number");
      }
    else
    {
        print("$c is the largest number");
    }

  }

  else
    {
      if(b>c)
        {
          print("$b is the largest number.");
        }
      else
        {
          print("$c is the largest number");
        }
    }

}
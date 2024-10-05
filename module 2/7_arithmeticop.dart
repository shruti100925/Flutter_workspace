import 'dart:io';

void main()
{
  print("Numbers are 15 and 3");
  print("1) addition \n2) Substraction \n3) Multiplication \n4) Division.");
  print("Enter number to choose from below:");
  var a=15;
  var b=3;
  var day= int.parse(stdin.readLineSync().toString());

  switch(day)
  {
    case 1:
      var add=a+b;
      print("Addition of number is $add");
      break;
    case 2:
      var sub=a-b;
      print("Addition of number is $sub");
      break;
    case 3:
      var mul=a*b;
      print("Addition of number is $mul");
      break;
    case 4:
      var div=a/b;
      print("Addition of number is $div");
      break;
    
  }
}
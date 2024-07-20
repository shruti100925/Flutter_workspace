import 'dart:io';

void main()
{
  print("Choose from below to find Area of. \n1)Triangle \n2)Rectangle \n3)Circle");
  var ch= int.parse(stdin.readLineSync().toString());

  if(ch==1)
    {
      print("Enter Base and height.");
      print("Base:");
      var b= int.parse(stdin.readLineSync().toString());

      print("Base:");
      var h= int.parse(stdin.readLineSync().toString());
      var area = (b*h)/2;
      print("area of triangle is $area");
    }
  else if(ch==2)
  {
    print("Enter Base and lenght.");
    print("Base:");
    var b= int.parse(stdin.readLineSync().toString());

    print("Lenght:");
    var l= int.parse(stdin.readLineSync().toString());
    var area= l*b;
    print("Area of circle with radius 5 is $area");
  }
  else if(ch==3)
    {
      var pi=3.14;
      print("Enter radius.");
      var r= int.parse(stdin.readLineSync().toString());

      var area= pi*r*r;
      print("Area of circle with radius 5 is $area");
    }
  else
    {
      print("Enter correct option.");
    }


}
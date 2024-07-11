import 'dart:io';

void main()
{
  print("Enter marks:");
  print("English:");
  var sub1 = int.parse(stdin.readLineSync().toString());

  print("Maths:");
  var sub2 = int.parse(stdin.readLineSync().toString());

  print("science:");
  var sub3 = int.parse(stdin.readLineSync().toString());

  print("History:");
  var sub4 = int.parse(stdin.readLineSync().toString());

  print("Computer:");
  var sub5 = int.parse(stdin.readLineSync().toString());


  var per = ((sub1+sub2+sub3+sub4+sub5)/500)*100;

  print("Percentage of student is $per");

}
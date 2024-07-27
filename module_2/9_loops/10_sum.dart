import 'dart:io';

void main()
{
  print("Entre any Nuumber to find First and Last Digit Summation Value.");
  int n1,summation,lastDigit,firstDigit ;
  n1 = int.parse(stdin.readLineSync().toString());
  lastDigit = n1 % 10;
  while(n1 >= 10)
  {
    double n2 = n1/10;
    n1 = n2.toInt();
  }
  firstDigit = n1;
  summation = firstDigit + lastDigit;
  print('$firstDigit + $lastDigit');
  print("Numbers First and Last Summation is $summation.");
}
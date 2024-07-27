void main()
{
  int num = 1024;
  print('Number is $num');
  String reversed = '';
  while (num > 0)
  {
    int digit = num % 10;
    reversed = '$reversed$digit';
    num = num ~/ 10;
  }
  print('Reversed Number: $reversed');
}
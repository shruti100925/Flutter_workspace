import 'dart:io';

void main()
{
  print("Enter number for fibonnacci series");
  var n = int.parse(stdin.readLineSync().toString());

  int t1 = 0;
  int t2 = 1;
  stdout.write("$t1 "); // Print the first two elements (0 and 1)

  for (int i = 2; i < n; i++) {
    int next = t1 + t2;
    stdout.write("$next  ");
    t1 = t2;
    t2 = next;
  }
}
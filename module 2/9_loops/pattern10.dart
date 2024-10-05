import 'dart:io';

void main()
{
  int count=1;
  int i,j;
  for(i=1; i<=5;i++)
  {
    for(j=1; j<=i; j++)
    {
      if (count == 1)
      {
        count = 0;
      }
      else
      {
        count = 1;
      }
      stdout.write("$count ");
    }
    stdout.write("\n");
  }
}
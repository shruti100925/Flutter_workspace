import 'dart:io';

void main()
{
  int i,j,k;
  int count=1;
  for( i=1 ;i<=5;i++)
  {
    for( j=1;j<=i;j++)
    {
      stdout.write("$count ");
      count++;
    }


    stdout.write("\n");
  }
}
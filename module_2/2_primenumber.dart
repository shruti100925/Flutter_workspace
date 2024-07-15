import 'dart:io';

void main()
{
  var i ;
  var count= 0;
  print("Enter num");

  var n = int.parse(stdin.readLineSync().toString());

  for(i=1;i<=n;i++)
    {
      if(n%i == 0)
        {
          count++;
        }

    }
  if (count == 2)
    {
      print("its prime number");
    }
  else
    {
      print("its not prime number");
    }


}
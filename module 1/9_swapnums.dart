void main()
{
  var a = 5;

  var b = 7;

  print("Value of num1 : $a Value of num2 : $b "  );


    a = a * b;
    b = a ~/ b;
    a = a ~/ b;


  print("After swapping: Value of num1 : $a Value of num2 : $b ");
}
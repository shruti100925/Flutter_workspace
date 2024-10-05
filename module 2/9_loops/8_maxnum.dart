void main()
{
  List<int> numbers = [10, 25, 3, 47, 19, 33];
  int maxNumber = numbers[0];

  for (int i = 1; i < numbers.length; i++) {
    if (numbers[i] > maxNumber) {
      maxNumber = numbers[i];
    }
  }

  print("The maximum number is: $maxNumber");
}
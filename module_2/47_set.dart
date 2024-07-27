void main()
{
  Set<dynamic> set = Set();
  Set<dynamic> set2 = Set();

  set.add("A");
  set.add("B");
  set.add("C");
  set.add(4);

  set2.add("A");
  set2.add(20);
  set2.add(3);
  set2.add(4);

  set.addAll(set2);

  print(set);


}
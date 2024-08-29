import 'dart:io';

void main() async {
  int N = int.parse(stdin.readLineSync()!);
  List<int> A = stdin.readLineSync()!.split(' ').map(int.parse).toList();
  int target = 0;
  List<int> sortedList = List.from(A);
  ;
  sortedList.sort((a, b) => b - a);

  target = sortedList[1];
  int index = A.indexOf(target);
  print(index + 1);
}

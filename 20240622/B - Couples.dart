import 'dart:io';

void main() {
  int N = int.parse(stdin.readLineSync()!);

  List<int> A = stdin.readLineSync()!.split(' ').map(int.parse).toList();

  int count = 0;

  for (var i = 1; i < A.length - 1; i++) {
    if (A[i - 1] == A[i + 1]) {
      count++;
    }
  }

  print(count);
}

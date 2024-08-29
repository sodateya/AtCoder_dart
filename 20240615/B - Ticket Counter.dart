import 'dart:io';

void main() {
  List NA = stdin.readLineSync()!.split(' ').map(int.parse).toList();
  int N = NA[0];
  int A = NA[1];
  List T = stdin.readLineSync()!.split(' ').map(int.parse).toList();
  int count = 0;

  for (var t in T) {
    if (t == count) {
      count += A;
      print(count);
    } else if (count <= t) {
      count = t + A;
      print(count);
    }
    else if  (count >= t) {
      count += A;
      print(count);
    }
  }
}


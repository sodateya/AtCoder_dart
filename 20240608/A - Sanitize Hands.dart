import 'dart:io';

void main() {
  List NM = stdin.readLineSync()!.split(' ').map(int.parse).toList();
  int N = NM[0];
  int M = NM[1];
  List<int> H = stdin.readLineSync()!.split(' ').map(int.parse).toList();
  int count = 0;
  for (var i = 0; i < H.length; i++) {
    if (M - H[i] < 0) {
      break;
    } else {
      M -= H[i];
      count += 1;
    }
  }
  print(count);
}

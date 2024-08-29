import 'dart:io';

void main() async {
  List NKX = stdin.readLineSync()!.split(' ').map(int.parse).toList();
  int K = NKX[1];
  int X = NKX[2];
  List A = stdin.readLineSync()!.split(' ').map(int.parse).toList();
  List output = List.from(A);
  output.insert(K, X);

  print(output.join(' '));
}

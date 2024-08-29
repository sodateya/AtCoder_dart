import 'dart:io';

void main() {
  int N = int.parse(stdin.readLineSync()!);
  String previousDish = '';

  for (int i = 0; i < N; i++) {
    String? dish = stdin.readLineSync();
    if (dish == null) {
      print('Input ended unexpectedly.');
      return;
    }
    if (previousDish == 'sweet' && dish == 'sweet' && i != N - 1) {
      print('No');
      return;
    }
    previousDish = dish;
  }
  print('Yes');
}

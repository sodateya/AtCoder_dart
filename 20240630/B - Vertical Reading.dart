import 'dart:io';

void main() {
  // 標準入力から値を読み込む
  List<String> input = stdin.readLineSync()!.split(' ');
  String s = input[0];
  String t = input[1];

  for (int w = 1; w < s.length; w++) {
    for (int c = 0; c < w; c++) {
      String temp = '';
      for (int i = c; i < s.length; i += w) {
        temp += s[i];
      }
      if (temp == t) {
        print('Yes');
        return;
      }
    }
  }
  print('No');
}

import 'dart:io';

void main() {
  String S = stdin.readLineSync()!;

  List<String> words = ["dream", "dreamer", "erase", "eraser"];

  while (S.isNotEmpty) {
    bool matched = false;
    for (String word in words) {
      if (S.endsWith(word)) {
        S = S.substring(0, S.length - word.length);
        matched = true;
        break;
      }
    }

    if (!matched) {
      print("NO");
      return;
    }
  }

  print("YES");
}

// https://atcoder.jp/contests/abs/tasks/arc065_a
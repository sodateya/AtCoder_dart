import 'dart:io';

int ten(int x) => x == 0 ? 1 : ten(x - 1) * 10;

void main() {
  int N = int.parse(stdin.readLineSync()!);
  if (N == 1) {
    print(0);
    return;
  }
  N--;
  for (int d = 1;; d++) {
    int x = (d + 1) ~/ 2;
    if (N <= 9 * ten(x - 1)) {
      String S = (ten(x - 1) + N - 1).toString();
      S = S.padRight(d, ' ');
      for (int i = x; i < d; i++) {
        S = S.substring(0, i) + S[d - 1 - i] + S.substring(i + 1);
      }
      print(S);
      return;
    } else {
      N -= 9 * ten(x - 1);
    }
  }
}

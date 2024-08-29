import 'dart:io';

void main() {
  String s = stdin.readLineSync()!;

  List<String> sList = s.split('').toList();
  int count = 0;

  do {
    print(isKaibun(sList));
  } while (count == sList.length ~/ 2);
}

bool isKaibun(List<String> s) {
  int n = s.length;
  for (var i = 0; i < n ~/ 2; i++) {
    if (s[i] == s[n - i - 1]) {
    } else {
      return false;
    }
  }
  return true;
}

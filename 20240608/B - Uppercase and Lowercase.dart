import 'dart:io';

void main() {
  String S = stdin.readLineSync()!;

  int upperCount = 0;
  int lowerCount = 0;

  for (int i = 0; i < S.length; i++) {
    if (S[i].toUpperCase() == S[i] && S[i].toLowerCase() != S[i]) {
      upperCount++;
    } else if (S[i].toLowerCase() == S[i] && S[i].toUpperCase() != S[i]) {
      lowerCount++;
    }
  }

  if (upperCount > lowerCount) {
    print(S.toUpperCase());
  } else {
    print(S.toLowerCase());
  }
}

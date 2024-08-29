import 'dart:io';

void main() {
  int N = int.parse(stdin.readLineSync()!);
  int TakahashiCount = 0;
  for (var i = 0; i < N; i++) {
    String S = stdin.readLineSync()!;
    if (S == 'Takahashi') {
      TakahashiCount += 1;
    }
  }
  print(TakahashiCount);
}

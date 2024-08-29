import 'dart:io';

void main() {
  int N = int.parse(stdin.readLineSync()!);
  String nowEat = '';
  String result = '';

  for (var i = 0; i < N; i++) {
    String eat = stdin.readLineSync()!;
    if (nowEat == 'sweet' && eat == 'sweet' && i != N -1) {
      result = 'No';
      break;
    } else {
      result = 'Yes';
    }
    nowEat = eat;
  }
  print(result);
}

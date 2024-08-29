import 'dart:io';

void main() async {
  int Y = int.parse(stdin.readLineSync()!);
  if (Y % 4 != 0) {
    print(365);
  } else if (Y % 400 == 0) {
    print(366);
  } else if (Y % 4 == 0 && Y % 100 != 0) {
    print(366);
  } else if (Y % 100 == 0 && 4 % 400 != 0) {
    print(365);
  }
}

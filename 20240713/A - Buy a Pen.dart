import 'dart:io';
import 'dart:math';

void main() {
  List RGB = stdin.readLineSync()!.split(' ').map(int.parse).toList();
  String C = stdin.readLineSync()!;

  RGB.removeAt(CtoIndex(C)!);
  print(min(RGB[0], RGB[1]));
}

int? CtoIndex(String c) {
  if (c == 'Red') {
    return 0;
  } else if (c == 'Green') {
    return 1;
  } else {
    return 2;
  }
}

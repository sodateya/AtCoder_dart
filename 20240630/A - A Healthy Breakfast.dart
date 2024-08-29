import 'dart:io';

void main() {
  List RSM = stdin.readLineSync()!.split('').toList();
  int rIndex = RSM.indexOf('R');
  int mIndex = RSM.indexOf('M');

  if (rIndex - mIndex < 0) {
    print('Yes');
  } else {
    print('No');
  }
}

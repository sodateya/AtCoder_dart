import 'dart:io';

void main() {
  List N = stdin.readLineSync()!.split(' ').map(int.parse).toList();
  int A = N[0];
  int B = N[1];
  int C = N[2];

  if (B < C) {
    List l = [];
    for (var i = 0; i < C - B; i++) {
      l.add(B + i);
    }
    print(l.contains(A) ? 'No' : 'Yes');
  } else if (B > C) {
    List l = [];
    for (var i = 0; i < B - C; i++) {
      l.add(C + 24 + i);
    }
    print(l.contains(A + 24) ? 'Yes' : 'No');
  } else {
    print('No');
  }
}

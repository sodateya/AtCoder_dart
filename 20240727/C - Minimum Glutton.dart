import 'dart:convert';
import 'dart:io';
import 'dart:math';

void main() async {
  List<String> inputs = stdin.readLineSync()!.split(' ');
  int n = int.parse(inputs[0]);
  int x = int.parse(inputs[1]);
  int y = int.parse(inputs[2]);

  var lines = await stdin.transform(utf8.decoder).transform(LineSplitter()).toList();
  String firstLine = lines[0];
  List<int> A = firstLine.split(' ').map(int.parse).toList();
  A.sort((a, b) => b - a);

  String secondLine = lines[1];
  List<int> B = secondLine.split(' ').map(int.parse).toList();
  B.sort((a, b) => b - a);

  int c1 = 0, c2 = 0;
  int sx = 0, sy = 0;

  for (int i = 0; i < n; i++) {
    sx += A[i];
    c1++;
    if (sx > x) {
      break;
    }
  }

  for (int i = 0; i < n; i++) {
    sy += B[i];
    c2++;
    if (sy > y) {
      break;
    }
  }

  print(min(c1, c2));
}

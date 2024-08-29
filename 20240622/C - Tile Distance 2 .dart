import 'dart:io';
import 'dart:math';

void main() {
  List<int> start = stdin.readLineSync()!.split(' ').map(int.parse).toList();
  List<int> end = stdin.readLineSync()!.split(' ').map(int.parse).toList();

  int sx = start[0];
  int sy = start[1];
  int tx = end[0];
  int ty = end[1];
  int h = ty - sy;

  if (ty == sy) {
    if ((tx + ty) % 2 != 0) {
      tx -= 1;
    }
    if ((sx + sy) % 2 != 0) {
      sx -= 1;
    }
    print((max(sx, tx) - min(sx, tx)) ~/ 2);
    return;
  } else if (ty > sy) {
    h = ty - sy;
  } else {
    h = sy - ty;
  }

  if (tx >= sx - h && tx <= sx + h + 1) {
    int ans = h;
    print(ans);
    return;
  } else {
    if ((sx + sy) % 2 != 0) {
      sx -= 1;
    }
    if (tx < sx - h) {
      sx = sx - h;
      if ((tx + ty) % 2 != 0) {
        tx -= 1;
      }
      if ((sx + ty) % 2 != 0) {
        sx -= 1;
      }
      int ans = h + (sx - tx) ~/ 2;
      print(ans);
    } else {
      sx = sx + h + 1;
      if ((tx + ty) % 2 != 0) {
        tx -= 1;
      }
      if ((sx + ty) % 2 != 0) {
        sx -= 1;
      }
      int ans = h + (tx - sx) ~/ 2;
      print(ans);
    }
  }
}

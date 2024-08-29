import 'dart:io';

class Box {
  int nameNum;
  int w;
  Box(this.nameNum, this.w);
}

void main() {
  int N = int.parse(stdin.readLineSync()!);
  List<int> A = stdin.readLineSync()!.split(' ').map(int.parse).toList();
  List<int> W = stdin.readLineSync()!.split(' ').map(int.parse).toList();

  List<Box> boxes = [];
  for (var i = 0; i < N; i++) {
    Box b = Box(A[i], W[i]);
    boxes.add(b);
  }

  Map<int, List<Box>> boxGroups = {};
  for (var box in boxes) {
    if (!boxGroups.containsKey(box.nameNum)) {
      boxGroups[box.nameNum] = [];
    }
    boxGroups[box.nameNum]!.add(box);
  }

  int totalRemovedWeight = 0;

  // 重複するnameNumごとに処理
  for (var entry in boxGroups.entries) {
    List<Box> group = entry.value;
    if (group.length > 1) {
      // 重さwでソートして、小さいものから除去
      group.sort((a, b) => a.w.compareTo(b.w));
      for (var i = 0; i < group.length - 1; i++) {
        totalRemovedWeight += group[i].w;
      }
    }
  }

  print(totalRemovedWeight);
}

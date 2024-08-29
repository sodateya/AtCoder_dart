import 'dart:io';

class Ant {
  bool direction; // false: negative direction, true: positive direction
  int position;
  Ant(this.direction, this.position);
}

void main() {
  List<int> NT = stdin.readLineSync()!.split(' ').map(int.parse).toList();
  int N = NT[0];
  int T = NT[1];
  String S = stdin.readLineSync()!;
  List<int> X = stdin.readLineSync()!.split(' ').map(int.parse).toList();

  List<Ant> ants = [];
  for (var i = 0; i < N; i++) {
    bool direction = S[i] == '1';
    Ant ant = Ant(direction, X[i]);
    ants.add(ant);
  }

  // アリの移動後の座標を計算
  for (var ant in ants) {
    ant.position += ant.direction ? T : -T;
  }

  // 右向きのアリと左向きのアリを分ける
  List<int> rightAnts = [];
  List<int> leftAnts = [];

  for (var ant in ants) {
    if (ant.direction) {
      rightAnts.add(ant.position);
    } else {
      leftAnts.add(ant.position);
    }
  }

  // ソート
  rightAnts.sort();
  leftAnts.sort();

  int count = 0;

  // 右向きのアリを基準に、左向きのアリとのすれ違いをカウント
  for (var rightPos in rightAnts) {
    int x = lowerBound(leftAnts, rightPos - 2 * T);
    int y = upperBound(leftAnts, rightPos);
    count += y - x;
  }

  print(count);
}

int lowerBound(List<int> list, int value) {
  int low = 0;
  int high = list.length;
  while (low < high) {
    int mid = (low + high) ~/ 2;
    if (list[mid] < value) {
      low = mid + 1;
    } else {
      high = mid;
    }
  }
  return low;
}

int upperBound(List<int> list, int value) {
  int low = 0;
  int high = list.length;
  while (low < high) {
    int mid = (low + high) ~/ 2;
    if (list[mid] <= value) {
      low = mid + 1;
    } else {
      high = mid;
    }
  }
  return low;
}

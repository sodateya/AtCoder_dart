import 'dart:io';

// 点の座標を表すクラス
class Point {
  final int x, y;
  Point(this.x, this.y);
}

// ベクトルの内積を計算する関数
int dotProduct(Point a, Point b) {
  return a.x * b.x + a.y * b.y;
}

// 2点間のベクトルを計算する関数
Point vector(Point a, Point b) {
  return Point(b.x - a.x, b.y - a.y);
}

// 3点が直角を形成するか確認する関数
bool isRightAngle(Point a, Point b, Point c) {
  Point ab = vector(a, b);
  Point bc = vector(b, c);
  Point ca = vector(c, a);

  // 各組み合わせの内積が0か確認する
  if (dotProduct(ab, bc) == 0) return true; // A-B と B-C が直角
  if (dotProduct(bc, ca) == 0) return true; // B-C と C-A が直角
  if (dotProduct(ca, ab) == 0) return true; // C-A と A-B が直角

  return false;
}

void main() {
  // 入力の読み取り

  List<int> aInput = stdin.readLineSync()!.split(' ').map(int.parse).toList();
  Point a = Point(aInput[0], aInput[1]);

  List<int> bInput = stdin.readLineSync()!.split(' ').map(int.parse).toList();
  Point b = Point(bInput[0], bInput[1]);

  List<int> cInput = stdin.readLineSync()!.split(' ').map(int.parse).toList();
  Point c = Point(cInput[0], cInput[1]);

  // 直角を形成するか確認
  if (isRightAngle(a, b, c)) {
    print("Yes");
  } else {
    print("No");
  }
}

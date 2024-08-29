import 'dart:io';
import 'dart:math';

class Point {
  final int x, y, z;

  Point(this.x, this.y, this.z);
}

class Cuboid {
  final Point minPoint;
  final Point maxPoint;

  Cuboid(Point a, Point b)
      : minPoint = Point(min(a.x, b.x), min(a.y, b.y), min(a.z, b.z)),
        maxPoint = Point(max(a.x, b.x), max(a.y, b.y), max(a.z, b.z));

  bool intersects(Cuboid other) {
    return (minPoint.x < other.maxPoint.x && maxPoint.x > other.minPoint.x) &&
        (minPoint.y < other.maxPoint.y && maxPoint.y > other.minPoint.y) &&
        (minPoint.z < other.maxPoint.z && maxPoint.z > other.minPoint.z);
  }
}

void main() {
  // 1つ目の直方体の入力
  List<int> abcdef = stdin.readLineSync()!.split(' ').map(int.parse).toList();
  Point A = Point(abcdef[0], abcdef[1], abcdef[2]);
  Point D = Point(abcdef[3], abcdef[4], abcdef[5]);
  Cuboid cuboid1 = Cuboid(A, D);

  // 2つ目の直方体の入力
  List<int> ghijkl = stdin.readLineSync()!.split(' ').map(int.parse).toList();
  Point G = Point(ghijkl[0], ghijkl[1], ghijkl[2]);
  Point J = Point(ghijkl[3], ghijkl[4], ghijkl[5]);
  Cuboid cuboid2 = Cuboid(G, J);

  // 交差判定
  if (cuboid1.intersects(cuboid2)) {
    print("Yes");
  } else {
    print("No");
  }
}

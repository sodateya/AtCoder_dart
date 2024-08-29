import 'dart:io';

void main() {
  // 標準入力からの読み取り
  List<int> nm = stdin.readLineSync()!.split(' ').map(int.parse).toList();
  int n = nm[0];
  int m = nm[1];

  List<int> a = stdin.readLineSync()!.split(' ').map(int.parse).toList();
  List<int> b = stdin.readLineSync()!.split(' ').map(int.parse).toList();

  // ソート
  a.sort();

  List<int> use = List<int>.filled(n, 0);
  int sum = 0;

  // bの各要素に対してaの中で適切な値を見つける
  for (int i = 0; i < m; i++) {
    int l = 0;
    int h = n - 1;
    int ans = -1;

    while (l <= h) {
      int mid = (l + h) ~/ 2;
      if (a[mid] >= b[i]) {
        if (use[mid] == 0) {
          ans = mid;
          h = mid - 1;
        } else if (mid > 0 && a[mid - 1] >= b[i]) {
          h = mid - 1;
        } else {
          l = mid + 1;
        }
      } else {
        l = mid + 1;
      }
    }

    if (ans == -1) {
      print(-1);
      return;
    }

    sum += a[ans];
    use[ans] = 1;
  }

  print(sum);
}

// TEL
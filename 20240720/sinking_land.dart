import 'dart:collection';
import 'dart:io';

void main() {
  List<String> input = stdin.readLineSync()!.split(' ');
  int h = int.parse(input[0]);
  int w = int.parse(input[1]);
  int n = int.parse(input[2]);

  List<List<int>> a = List.generate(h, (_) => List.filled(w, 0));
  List<List<bool>> inland = List.generate(h, (_) => List.filled(w, true));
  List<Queue<int>> q = List.generate(n + 1, (_) => Queue<int>());

  int ans = h * w;

  for (int i = 0; i < h; i++) {
    input = stdin.readLineSync()!.split(' ');
    for (int j = 0; j < w; j++) {
      a[i][j] = int.parse(input[j]);
      if (i == 0 || i == h - 1 || j == 0 || j == w - 1) {
        q[a[i][j]].add(w * i + j);
        inland[i][j] = false;
      }
    }
  }

  List<int> dx = [0, 0, -1, 1];
  List<int> dy = [1, -1, 0, 0];

  for (int i = 1; i <= n; i++) {
    while (q[i].isNotEmpty) {
      ans--;
      int z = q[i].removeFirst();
      int x = z ~/ w;
      int y = z % w;

      for (int j = 0; j < 4; j++) {
        int nx = x + dx[j];
        int ny = y + dy[j];

        if (nx >= 0 && nx < h && ny >= 0 && ny < w && inland[nx][ny]) {
          q[a[nx][ny] <= i ? i : a[nx][ny]].add(w * nx + ny);
          inland[nx][ny] = false;
        }
      }
    }
    print(ans);
  }
}

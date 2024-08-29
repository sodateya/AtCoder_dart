import 'dart:io';
import 'dart:math';

void main() {
  int N = int.parse(stdin.readLineSync()!);
  String S = stdin.readLineSync()!;
  int INF = 1000000000;

  int score(int x, int y) {
    if ((x - y) % 3 == 1) return 1;
    if (x == y) return 0;
    return -INF;
  }

  List<List<int>> dp = List.generate(N + 1, (_) => List.filled(3, -INF));
  dp[0][0] = dp[0][1] = dp[0][2] = 0;

  for (int i = 0; i < N; i++) {
    int y = {'R': 0, 'P': 1, 'S': 2}[S[i]]!;
    for (int j = 0; j < 3; j++) {
      for (int k = 0; k < 3; k++) {
        if (k != j) {
          dp[i + 1][k] = max(dp[i + 1][k], dp[i][j] + score(k, y));
        }
      }
    }
  }

  int result = max(dp[N][0], max(dp[N][1], dp[N][2]));
  print(result);
}

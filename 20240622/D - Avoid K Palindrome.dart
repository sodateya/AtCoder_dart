import 'dart:io';

void main() {
  List<int> NK = stdin.readLineSync()!.split(' ').map(int.parse).toList();
  int n = NK[0];
  int k = NK[1];
  String s = stdin.readLineSync()!;
  const int MOD = 998244353;

  List<int> pal = [];
  List<List<int>> mem = [];

  int dfs(int i, int j) {
    if (i < 0) return 1;
    if (mem[i][j] != -1) return mem[i][j];
    int ans = 0;
    for (int b in [0, 1]) {
      if (s[i] != '?' && b != (s[i].codeUnitAt(0) - 'A'.codeUnitAt(0)))
        continue;
      int t = (j << 1) | b;
      if (i > n - k || pal[t] == 0) {
        ans += dfs(i - 1, t & ((1 << (k - 1)) - 1));
        ans %= MOD;
      }
    }
    mem[i][j] = ans;
    return ans;
  }

  pal = List<int>.filled(1 << k, 0);
  for (int i = 0; i < (1 << k); i++) {
    bool ok = true;
    for (int j = 0; j < k ~/ 2; j++) {
      if ((i >> j & 1) != (i >> (k - 1 - j) & 1)) {
        ok = false;
        break;
      }
    }
    if (ok) pal[i] = 1;
  }

  mem = List<List<int>>.generate(n, (_) => List<int>.filled(1 << k, -1));

  print(dfs(n - 1, 0));
}

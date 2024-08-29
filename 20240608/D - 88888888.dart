import 'dart:io';

const int MOD = 998244353;

// 高速べき乗法を使用してべき乗を計算する関数
int ksm(int a, int b, int mod) {
  a = a % mod;
  int ans = 1;
  while (b > 0) {
    if (b & 1 != 0) {
      ans = ans * a % mod;
    }
    a = a * a % mod;
    b = b >> 1;
  }
  return ans;
}

void main() {
  // 標準入力からの読み取り
  int n = int.parse(stdin.readLineSync()!);

  int now = n;
  int p = 1;

  while (now > 0) {
    now = now ~/ 10;
    p = p * 10 % MOD;
  }

  int part1 = n % MOD;
  int part2 = (ksm(p, n, MOD) - 1) % MOD;
  int part3 = ksm(p - 1, MOD - 2, MOD) % MOD;

  int ans = part1 * part2 % MOD * part3 % MOD;
  ans = (ans % MOD + MOD) % MOD;

  print(ans);
}

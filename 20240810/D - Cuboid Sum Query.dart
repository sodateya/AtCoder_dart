import 'dart:convert';
import 'dart:io';

void main() async {
  // 標準入力を非同期で読み取る
  final input =
      stdin.transform(utf8.decoder).transform(LineSplitter()).toList();
  List<String> lines = await input;

  // 入力処理
  int lineIndex = 0;
  int n = int.parse(lines[lineIndex++]);

  // 3次元配列の初期化
  List<List<List<int>>> a = List.generate(
      n + 1, (_) => List.generate(n + 1, (_) => List.filled(n + 1, 0)));
  List<List<List<int>>> sum = List.generate(
      n + 1, (_) => List.generate(n + 1, (_) => List.filled(n + 1, 0)));

  // 配列aの読み取り
  for (int i = 1; i <= n; i++) {
    for (int j = 1; j <= n; j++) {
      var line = lines[lineIndex++].split(' ').map(int.parse).toList();
      for (int k = 1; k <= n; k++) {
        a[i][j][k] = line[k - 1];
      }
    }
  }

  // 累積和の計算
  for (int i = 1; i <= n; i++) {
    for (int j = 1; j <= n; j++) {
      for (int k = 1; k <= n; k++) {
        sum[i][j][k] = a[i][j][k] +
            sum[i - 1][j][k] +
            sum[i][j - 1][k] +
            sum[i][j][k - 1] -
            sum[i - 1][j - 1][k] -
            sum[i - 1][j][k - 1] -
            sum[i][j - 1][k - 1] +
            sum[i - 1][j - 1][k - 1];
      }
    }
  }

  // クエリの処理
  int q = int.parse(lines[lineIndex++]);
  List<int> results = [];

  for (int qi = 0; qi < q; qi++) {
    var query = lines[lineIndex++].split(' ').map(int.parse).toList();
    int lx = query[0], rx = query[1];
    int ly = query[2], ry = query[3];
    int lz = query[4], rz = query[5];

    int result = sum[rx][ry][rz] -
        sum[lx - 1][ry][rz] -
        sum[rx][ly - 1][rz] -
        sum[rx][ry][lz - 1] +
        sum[lx - 1][ly - 1][rz] +
        sum[lx - 1][ry][lz - 1] +
        sum[rx][ly - 1][lz - 1] -
        sum[lx - 1][ly - 1][lz - 1];

    results.add(result);
  }

  // 結果の出力
  for (var res in results) {
    print(res);
  }
}

import 'dart:io';

void main() {
  List<int> NM = stdin.readLineSync()!.split(' ').map(int.parse).toList();
  int N = NM[0];
  int M = NM[1];
  List<List<String>> L = [];
  for (var i = 0; i < N; i++) {
    List<String> l = stdin.readLineSync()!.split('');
    L.add(l);
  }

  int result = minSetsToCover(L, M);
  print(result);
}

int minSetsToCover(List<List<String>> lists, int m) {
  int n = lists.length;
  int minCount = n + 1;

  for (int i = 0; i < (1 << n); i++) {
    List<int> covered = List<int>.filled(m, 0);
    int count = 0;

    for (int j = 0; j < n; j++) {
      if ((i & (1 << j)) != 0) {
        count++;
        for (int k = 0; k < m; k++) {
          if (lists[j][k] == 'o') {
            covered[k] = 1;
          }
        }
      }
    }

    if (covered.every((e) => e == 1)) {
      if (count < minCount) {
        minCount = count;
      }
    }
  }

  return minCount;
}

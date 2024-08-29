import 'dart:io';

void main() {
  List<String> NK = stdin.readLineSync()!.split(' ');
  int N = int.parse(NK[0]);
  int K = int.parse(NK[1]);
  List<int> A = stdin.readLineSync()!.split(' ').map(int.parse).toList();

  A.sort();

  int minDifference = A[N - K - 1] - A[0];
  for (int i = 1; i <= K; i++) {
    int currentDifference = A[N - K - 1 + i] - A[i];
    if (currentDifference < minDifference) {
      minDifference = currentDifference;
    }
  }

  // 結果を出力
  print(minDifference);
}

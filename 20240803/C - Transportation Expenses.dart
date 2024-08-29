import 'dart:io';
import 'dart:math';

void main() async {
  List<int> NM = stdin.readLineSync()!.split(' ').map(int.parse).toList();
  int N = NM[0];
  int M = NM[1];
  List<int> A = stdin.readLineSync()!.split(' ').map(int.parse).toList();

  int totalCost = A.reduce((a, b) => a + b);

  if (totalCost <= M) {
    print('infinite');
    return;
  }

  int low = 1;
  int high = A.reduce(max);
  int result = 0;

  while (low <= high) {
    int mid = (low + high) ~/ 2;
    int sum = 0;

    for (int i = 0; i < N; i++) {
      sum += min(A[i], mid);
      if (sum > M) break;
    }

    if (sum <= M) {
      result = mid;
      low = mid + 1;
    } else {
      high = mid - 1;
    }
  }

  print(result);
}

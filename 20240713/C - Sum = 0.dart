import 'dart:convert';
import 'dart:io';
import 'dart:math';

void main() async {
  int N = int.parse(stdin.readLineSync()!);
  List<int> L = [];
  List<int> R = [];

  var lines =
      await stdin.transform(utf8.decoder).transform(LineSplitter()).toList();

  for (int i = 0; i < N; i++) {
    List<int> input = lines[i].split(' ').map(int.parse).toList();
    L.add(input[0]);
    R.add(input[1]);
  }

  List<int> X = List.filled(N, 0);
  int currentSum = 0;

  for (int i = 0; i < N; i++) {
    int li = L[i];
    int ri = R[i];
    int xi = (li + ri) ~/ 2;

    X[i] = xi;
    currentSum += xi;
  }

  for (int i = 0; i < N && currentSum != 0; i++) {
    int xi = X[i];
    int li = L[i];
    int ri = R[i];

    if (currentSum > 0 && xi > li) {
      int diff = min(currentSum, xi - li);
      X[i] -= diff;
      currentSum -= diff;
    } else if (currentSum < 0 && xi < ri) {
      int diff = min(-currentSum, ri - xi);
      X[i] += diff;
      currentSum += diff;
    }
  }

  if (currentSum == 0) {
    print("Yes");
    print(X.join(' '));
  } else {
    print("No");
  }
}

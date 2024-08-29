import 'dart:io';

void main() {
  List<int> NM = stdin.readLineSync()!.split(' ').map(int.parse).toList();
  int N = NM[0];
  int M = NM[1];

  List<int> A = stdin.readLineSync()!.split(' ').map(int.parse).toList();

  List<int> r = [0];

  for (int i = 0; i < 2 * N; i++) {
    r.add((r.last + A[i % N]) % M);
  }

  List<int> b = List.filled(M, 0);

  for (int i = 0; i < N; i++) {
    b[r[i]]++;
  }

  int res = 0;
  for (int i = N; i < 2 * N; i++) {
    b[r[i - N]]--;
    res += b[r[i]];
    b[r[i]]++;
  }

  print(res);
}

import 'dart:io';

void main() {
  List<int> NTA = stdin.readLineSync()!.split(' ').map(int.parse).toList();
  int N = NTA[0];
  int T = NTA[1];
  int A = NTA[2];

  int max = T > A ? T : A;
  int min = T > A ? A : T;

  int rest = N - (T + A);
  rest += min;

  if (rest > max) {
    print("No");
  } else {
    print("Yes");
  }
}

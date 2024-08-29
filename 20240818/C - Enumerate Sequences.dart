import 'dart:io';

void main() {
  List<int> firstLine =
      stdin.readLineSync()!.split(' ').map(int.parse).toList();
  int N = firstLine[0];
  int K = firstLine[1];

  List<int> R = stdin.readLineSync()!.split(' ').map(int.parse).toList();

  List<List<int>> results = [];

  void dfs(List<int> current, int index) {
    if (index == N) {
      int sum = current.reduce((a, b) => a + b);
      if (sum % K == 0) {
        results.add(List.from(current));
      }
      return;
    }
    for (int i = 1; i <= R[index]; i++) {
      current.add(i);
      dfs(current, index + 1);
      current.removeLast();
    }
  }

  dfs([], 0);

  if (results.isEmpty) {
    print(" ");
  } else {
    for (var result in results) {
      print(result.join(' '));
    }
  }
}

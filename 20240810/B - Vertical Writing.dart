import 'dart:io';

void main() async {
  int N = int.parse(stdin.readLineSync()!);

  List<String> sList = [];

  for (int i = 0; i < N; i++) {
    sList.add(stdin.readLineSync()!);
  }

  int maxLength = sList.map((s) => s.length).reduce((a, b) => a > b ? a : b);

  List<String> result = List.filled(maxLength, '');

  for (int i = 0; i < maxLength; i++) {
    for (String s in sList.reversed) {
      if (i < s.length) {
        result[i] += s[i];
      } else {
        result[i] += '*';
      }
    }
  }


  for (int i = 0; i < result.length; i++) {
    result[i] = result[i].replaceAll(RegExp(r'\*+$'), '');
  }

  for (String line in result) {
    print(line);
  }
}

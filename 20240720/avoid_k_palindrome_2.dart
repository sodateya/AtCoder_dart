import 'dart:io';

void main() {
  List<String> input = stdin.readLineSync()!.split(' ');
  int N = int.parse(input[0]);
  int K = int.parse(input[1]);
  String S = stdin.readLineSync()!;

  // 文字列 S の全順列を生成
  List<String> permutations = generatePermutations(S);

  // 長さ K の回文を含まない順列の数をカウント
  int count = 0;
  for (String permutation in permutations) {
    if (!containsKLengthPalindrome(permutation, K)) {
      count++;
    }
  }

  print(count);
}

// 文字列の全順列を生成する関数
List<String> generatePermutations(String s) {
  List<String> result = [];
  _permute(s.split(''), 0, result);
  return result.toSet().toList(); // 重複を除く
}

void _permute(List<String> chars, int start, List<String> result) {
  if (start == chars.length - 1) {
    result.add(chars.join());
    return;
  }
  for (int i = start; i < chars.length; i++) {
    _swap(chars, start, i);
    _permute(chars, start + 1, result);
    _swap(chars, start, i); // 戻す
  }
}

void _swap(List<String> chars, int i, int j) {
  String temp = chars[i];
  chars[i] = chars[j];
  chars[j] = temp;
}

// 長さ K の回文を含むかどうかをチェックする関数
bool containsKLengthPalindrome(String s, int K) {
  for (int i = 0; i <= s.length - K; i++) {
    String substring = s.substring(i, i + K);
    if (isPalindrome(substring)) {
      return true;
    }
  }
  return false;
}

// 文字列が回文かどうかをチェックする関数
bool isPalindrome(String s) {
  int len = s.length;
  for (int i = 0; i < len ~/ 2; i++) {
    if (s[i] != s[len - 1 - i]) {
      return false;
    }
  }
  return true;
}

// https://atcoder.jp/contests/abc363/tasks/abc363_c
// ⭐️



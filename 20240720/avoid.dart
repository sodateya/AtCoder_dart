import 'dart:io';

bool nextStringPermutation(List<String> strList) {
  int n = strList.length;
  if (n < 2) return false;

  int k = n - 2;
  while (k >= 0 && strList[k].compareTo(strList[k + 1]) >= 0) {
    k--;
  }
  if (k < 0) {
    return false;
  }

  int l = n - 1;
  while (strList[k].compareTo(strList[l]) >= 0) {
    l--;
  }

  String temp = strList[k];
  strList[k] = strList[l];
  strList[l] = temp;

  int start = k + 1;
  int end = n - 1;
  while (start < end) {
    temp = strList[start];
    strList[start] = strList[end];
    strList[end] = temp;
    start++;
    end--;
  }

  return true;
}

bool nextInrPermutation(List<int> list) {
  int n = list.length;
  if (n < 2) return false;

  int k = n - 2;
  while (k >= 0 && list[k] >= list[k + 1]) {
    k--;
  }
  if (k < 0) {
    return false;
  }

  int l = n - 1;
  while (list[k] >= list[l]) {
    l--;
  }

  int temp = list[k];
  list[k] = list[l];
  list[l] = temp;

  int start = k + 1;
  int end = n - 1;
  while (start < end) {
    temp = list[start];
    list[start] = list[end];
    list[end] = temp;
    start++;
    end--;
  }

  return true;
}

void main() {
  List<int> NK = stdin.readLineSync()!.split(' ').map(int.parse).toList();
  int n = NK[0];
  int k = NK[1];

  String s = stdin.readLineSync()!;
  List<String> a = s.split('').toList();
  a.sort();
  int ans = 0;
  bool ok, flag;

  while (true) {
    ok = true;
    for (int i = 0; i <= n - k; i++) {
      flag = true;
      for (int j = 0; j < k; j++) {
        if (a[i + j] != a[i + k - 1 - j]) {
          flag = false;
          break;
        }
      }
      if (flag) {
        ok = false;
        break;
      }
    }
    if (ok) {
      ans++;
    }
    if (!nextStringPermutation(a)) {
      break;
    }
  }

  print(ans);
}

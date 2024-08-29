import 'dart:io';

void main() async {
  // 標準入力からのデータ読み取り
  var firstLine = stdin.readLineSync()!.split(' ').map(int.parse).toList();
  int n = firstLine[0];
  int Q = firstLine[1];

  var A = stdin.readLineSync()!.split(' ').map(int.parse).toList();
  A.sort();

  for (int i = 0; i < Q; i++) {
    var query = stdin.readLineSync()!.split(' ').map(int.parse).toList();
    int b = query[0];
    int k = query[1];

    int l = -1;
    int r = 1 << 30;

    while (r - l > 1) {
      int mid = (l + r) ~/ 2;
      int cnt = bisectRight(A, b + mid) - bisectLeft(A, b - mid);
      if (cnt >= k) {
        r = mid;
      } else {
        l = mid;
      }
    }

    print(r);
  }
}

int bisectLeft(List<int> list, int value) {
  int low = 0;
  int high = list.length;
  while (low < high) {
    int mid = (low + high) ~/ 2;
    if (list[mid] < value) {
      low = mid + 1;
    } else {
      high = mid;
    }
  }
  return low;
}

int bisectRight(List<int> list, int value) {
  int low = 0;
  int high = list.length;
  while (low < high) {
    int mid = (low + high) ~/ 2;
    if (list[mid] <= value) {
      low = mid + 1;
    } else {
      high = mid;
    }
  }
  return low;
}


// バイナリーサーチ

// int binarySearch(list, element) {
//   int start = 0;
//   int end = list.length - 1;
//   int i = 0;
//   while (start <= end) {
//     int mid = ((start + end) / 2).floor();
//     if (list[mid] == element) {
//       return mid;
//     }
//     if (list[mid] < element) {
//       start = mid + 1;
//     } else {
//       end = mid - 1;
//     }
//   }
//   return -1;
// }
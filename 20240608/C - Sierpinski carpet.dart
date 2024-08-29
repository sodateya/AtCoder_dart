import 'dart:io';

void main() {
  int n = int.parse(stdin.readLineSync()!);

  int size = pow(3, n).toInt();

  List<List<String>> grid =
      List.generate(size, (_) => List.generate(size, (_) => '#'));

  fillGrid(grid, size, 0, 0);

  for (List<String> row in grid) {
    print(row.join());
  }
}

void fillGrid(List<List<String>> grid, int size, int row, int col) {
  if (size == 1) {
    return;
  }

  int newSize = size ~/ 3;

  for (int i = row + newSize; i < row + 2 * newSize; i++) {
    for (int j = col + newSize; j < col + 2 * newSize; j++) {
      grid[i][j] = '.';
    }
  }

  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      if (i != 1 || j != 1) {
        fillGrid(grid, newSize, row + i * newSize, col + j * newSize);
      }
    }
  }
}

int pow(int base, int exp) {
  int result = 1;
  for (int i = 0; i < exp; i++) {
    result *= base;
  }
  return result;
}

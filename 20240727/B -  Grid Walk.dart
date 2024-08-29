import 'dart:io';

void main() {
  List<String> firstLine = stdin.readLineSync()!.split(' ');
  int H = int.parse(firstLine[0]);
  int W = int.parse(firstLine[1]);

  List<String> secondLine = stdin.readLineSync()!.split(' ');
  int Si = int.parse(secondLine[0]);
  int Sj = int.parse(secondLine[1]);
  List<List<String>> grid = [];

  for (var i = 0; i < H; i++) {
    List<String> c = stdin.readLineSync()!.split('');
    grid.add(c);
  }
  String X = stdin.readLineSync()!.trim();

  int x = Si - 1;
  int y = Sj - 1;

  for (int i = 0; i < X.length; i++) {
    if (X[i] == 'L' && y > 0 && grid[x][y - 1] == '.') {
      y -= 1;
    } else if (X[i] == 'R' && y < W - 1 && grid[x][y + 1] == '.') {
      y += 1;
    } else if (X[i] == 'U' && x > 0 && grid[x - 1][y] == '.') {
      x -= 1;
    } else if (X[i] == 'D' && x < H - 1 && grid[x + 1][y] == '.') {
      x += 1;
    }
  }
  print("${x + 1} ${y + 1}");
}

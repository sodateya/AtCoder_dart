import 'dart:convert';
import 'dart:io';

void main() async {
  int N = int.parse(stdin.readLineSync()!);
  Map<int, int> balls = {};
  var lines =
      await stdin.transform(utf8.decoder).transform(LineSplitter()).toList();

  for (int i = 0; i < N; i++) {
    List<String> query = lines[i].split(' ');
    int operation = int.parse(query[0]);
    int ball = query.length > 1 ? int.parse(query[1]) : 0;

    if (operation == 1) {
      if (balls.containsKey(ball)) {
        balls[ball] = balls[ball]! + 1;
      } else {
        balls[ball] = 1;
      }
    } else if (operation == 2) {
      if (balls.containsKey(ball) && balls[ball]! > 0) {
        balls[ball] = balls[ball]! - 1;
        if (balls[ball] == 0) {
          balls.remove(ball);
        }
      }
    } else if (operation == 3) {
      print(balls.keys.length);
    }
  }
}

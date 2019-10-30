import 'main.dart';
import 'package:test/test.dart';

void main() {
  test("test case 1", () {
    expect(josephus(10, 3), 5);
  });

  test("test case 2", () {
    expect(
        groupSeats([
          [1, 0, 1, 0, 1, 0, 1],
          [0, 1, 0, 1, 0, 1, 0],
          [0, 0, 1, 1, 1, 1, 1],
          [1, 0, 1, 1, 0, 0, 1],
          [1, 1, 1, 0, 1, 0, 1],
          [0, 1, 1, 1, 1, 0, 0]
        ], 2),
        3);
    expect(
        groupSeats([
          [0, 0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0, 0],
        ], 2),
        18);
  });
}

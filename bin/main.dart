// Challenge 1
// Write test cases including boundary conditions for given challenges

// Challenge 2
// Josephus Problem
// This classic problem dates back to Roman times. There are 41 soldiers arranged
// in a circle. Every third soldier is to be killed by their captors, continuing
// around the circle until only one soldier remains. He is to be freed. Assuming
// you would like to stay alive, at what position in the circle would you stand?
int josephus(int total, int x) {
  //create list of numbers with total as length
  List totalList = List.generate(total, (i) => i + 1);
  //1,2,3,4,5
  print(totalList);
  List tempList = [];
  while (totalList.length > 1) {
    tempList = totalList;
    //tel 1,2,3,4,5
    for (int i = 1; i <= totalList.length; i++) {
      if (i % x == 0) {
        print("1 temp $tempList  total $totalList");
        tempList.remove(totalList[i - 1]);
        totalList[i - 1] = 0;
      } else {
        print("2 temp $tempList  total $totalList");
        int tempNo = totalList[i - 1];
        tempList.remove(totalList[i - 1]);
        tempList.add(tempNo);
        print("3 temp $tempList  total $totalList");
      }
      print("4 temp $tempList  total $totalList");
    }
    totalList = tempList;
    print(totalList);
  }
  return totalList[0];
}
// Generalize this problem by creating a function that accepts the number of
// soldiers n and the interval at which they are killed i, and returns the
// position of the fortunate survivor.

// Challenge 3
// Movie Theater Seating
// A group of n friends are going to see a movie. They would like to find a spot
// where they can sit next to each other in the same row. A movie theater's seat
// layout can be represented as a 2-D matrix, where 0s represent empty seats and
// 1s represent taken seats.

// Create a function that, given a seat layout and the number of friends n,
// returns the number of available spots for all n friends to sit together.
//
//Examples
//groupSeats([
//[1, 0, 1, 0, 1, 0, 1],
//[0, 1, 0, 1, 0, 1, 0],
//[0, 0, 1, 1, 1, 1, 1],
//[1, 0, 1, 1, 0, 0, 1],
//[1, 1, 1, 0, 1, 0, 1],
//[0, 1, 1, 1, 1, 0, 0]
//], 2) ➞ 3
int groupSeats(List<List<int>> seats, int friends) {
  int count = 0;
  int result = 0;
  for (int i = 0; i < seats.length; i++) {
    for (int j = 0; j < seats[i].length; j++) {
      if (seats[i][j] == 0) {
        count++; //as soon as you find empty seat increase count
        if (count == friends) {
          result++; //increase result as soon as count becomes equal to number of friends
          count = 0; //reset count when count becomes equal to number of friends
        }
      } else if (seats[i][j] == 1) {
        if (count != 0) {
          count = 0;
        }
      }
    }
    count = 0;
  }

  return result;
}

main() {
  print(groupSeats([
    [1, 0, 1, 0, 1, 0, 1],
    [0, 1, 0, 1, 0, 1, 0],
    [0, 0, 1, 1, 1, 1, 1],
    [1, 0, 1, 1, 0, 0, 1],
    [1, 1, 1, 0, 1, 0, 1],
    [0, 1, 1, 1, 1, 0, 0]
  ], 2));

  print(josephus(5, 2));
}

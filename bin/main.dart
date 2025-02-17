// Challenge 1
// Write test cases including boundary conditions for given challenges

// Challenge 2
// Josephus Problem
// This classic problem dates back to Roman times. There are 41 soldiers arranged
// in a circle. Every third soldier is to be killed by their captors, continuing
// around the circle until only one soldier remains. He is to be freed. Assuming
// you would like to stay alive, at what position in the circle would you stand?
int josephus(int soldiers, int x) {
  //create list of soldiersList with total as length
  List soldiersList = List.generate(soldiers, (i) => i + 1);
  //1,2,3,4,5
  while (soldiersList.length >= x) {
    int remaining = soldiersList.length % x;
    int listLength = soldiersList.length;
    List tempList = [];
    for (int i = listLength - remaining; i < listLength; i++) {
      tempList.add(soldiersList[i]);
    }
    for (int i = 1; i <= listLength; i++) {
      if (i % x == 0) {
        soldiersList[i - 1] = 0;
      }
    }
    //instead of soldiersList.length it should be a variable which doesn't change, reset it at the end of everything
    // i= soldiersList.length-1  >= soldiersList.length-remaining
    for (int i = listLength - 1; i >= listLength - remaining; i--) {
      soldiersList.removeAt(i);
    }
    soldiersList.removeWhere((x) => x == 0);

    var list = []..addAll(tempList)..addAll(soldiersList);
    soldiersList = add2Lists(tempList, soldiersList);
  }
  return trimMore(soldiersList, x);
}

//this function when soldiers list length reduces to less than x. that is if every 3rd soldier
//is to be killed then total number of soldiers left are 2
int trimMore(List numbers, int x) {
//     int x=3;
//   List<int> numbers =[10,4];
  while (numbers.length <= x) {
    for (int i = 0; numbers.length < x; i++) {
      numbers.add(numbers[i]);
    }

    int removeNumber = numbers[numbers.length - 1];
    numbers.removeWhere((x) => x == removeNumber);

    List<int> unique = numbers.toSet().toList();
    if (unique.length == 1) {
      x = unique[0];
      break;
    }
  }
  return x;
}

List add2Lists(List list1, List list2) {
  List<int> finalList = [];
  for (int i = 0; i < list1.length; i++) {
    finalList.add(list1[i]);
  }
  for (int i = 0; i < list2.length; i++) {
    finalList.add(list2[i]);
  }
  return finalList;
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

  print(josephus(10, 3));
}

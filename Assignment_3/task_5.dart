void main() {
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
  print("Numbers: $numbers");
  List<int> evenNumbers = filterNumbers(numbers, (int n) => n % 2 == 0);
  print("Even numbers: $evenNumbers");

  List<int> oddNumbers = filterNumbers(numbers, (int n) => n % 2 != 0);
  print("Odd numbers: $oddNumbers");

  List<int> primeNumbers = filterNumbers(numbers, (int n) {
    if (n < 2) return false;
    for (int i = 2; i <= n / 2; i++) {
      if (n % i == 0) return false;
    }
    return true;
  });
  print(" Prime numbers: $primeNumbers");
}

List<int> filterNumbers(List<int> list, bool Function(int) predicate) {
  List<int> filteredList = [];

  for (int element in list) {
    if (predicate(element)) {
      filteredList.add(element);
    }
  }

  return filteredList;
}


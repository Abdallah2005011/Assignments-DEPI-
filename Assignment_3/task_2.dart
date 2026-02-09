void main() {
  String person = createPerson('Ahmed');
  print(person);
}

String createPerson(String name, [int? age, String? city]) {
  return 'Name:$name,Age:${age ??'unKnown'},City:${city ?? 'unknown'}';
}

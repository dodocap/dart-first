void main() {
  final numString = '10.5';

  // Unhandled exception:
  // FormatException: Invalid radix-10 number (at character 1)
  int num = int.parse(numString);

  print(num);
}
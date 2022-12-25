// ignore_for_file: constant_identifier_names

enum Month {
  january,
  february,
  march,
  april,
  may,
  june,
  july,
  august,
  september,
  october,
  november,
  december;

  String get shortName => name.substring(0, 3);
}

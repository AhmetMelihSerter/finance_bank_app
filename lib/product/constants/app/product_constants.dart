// ignore_for_file: non_constant_identifier_names

import 'package:flutter_dotenv/flutter_dotenv.dart';

class ProductConstants {
  ProductConstants._();

  static String get SECURE_KEY => dotenv.get('SECURE_KEY');
}

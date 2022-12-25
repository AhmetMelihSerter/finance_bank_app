// ignore_for_file: constant_identifier_names

import 'package:finance_bank_app/core/constants/enums/app_enum.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApplicationConstants {
  ApplicationConstants._();

  static const String APP_NAME = 'Finance Bank App';

  static AppMode get appMode => kDebugMode ? AppMode.debug : AppMode.release;

  static String get baseUrl => appMode != AppMode.release
      ? dotenv.get('BASE_URL_TEST')
      : dotenv.get('BASE_URL');
}

const kZero = 0;
const kOne = 1;

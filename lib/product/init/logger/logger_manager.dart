import 'package:finance_bank_app/core/constants/app/application_constants.dart';
import 'package:finance_bank_app/core/constants/enums/app_enum.dart';
import 'package:finance_bank_app/core/init/logger/i_logger_manager.dart';
import 'package:logger/logger.dart';

class LoggerManager implements ILoggerManager {
  LoggerManager._internal()
      : _logger = Logger(
          printer: PrettyPrinter(
            methodCount: 1,
            errorMethodCount: 5,
            lineLength: 50,
            printTime: true,
          ),
          level: ApplicationConstants.appMode == AppMode.debug
              ? Level.debug
              : Level.info,
        );
  static LoggerManager? _instance;

  static LoggerManager get instance => _instance ??= LoggerManager._internal();

  final Logger _logger;

  @override
  void debug(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.d(message, error, stackTrace);
  }

  @override
  void error(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error, stackTrace);
  }

  @override
  void info(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.i(message, error, stackTrace);
  }

  @override
  void verbose(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.v(message, error, stackTrace);
  }

  @override
  void warning(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.w(message, error, stackTrace);
  }

  @override
  void whtf(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.wtf(message, error, stackTrace);
  }
}

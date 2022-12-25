import 'package:flutter/services.dart';

class VehicleIdNotFound extends PlatformException {
  VehicleIdNotFound({
    super.code = '001',
    super.message = 'Vehicle Id Not Found',
    this.userMessage = 'Araç Id Bulunamadı.',
    super.details,
    super.stacktrace,
  });

  final String userMessage;

  @override
  String toString() =>
      'VehicleIdNotFound($code, $message, $userMessage, $details, $stacktrace)';
}

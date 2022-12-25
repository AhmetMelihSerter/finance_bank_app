import 'package:finance_bank_app/product/init/network/dio_manager.dart';

abstract class BaseService {
  BaseService(this.manager);

  final DioManager manager;

  final duration = const Duration(seconds: 1);
}

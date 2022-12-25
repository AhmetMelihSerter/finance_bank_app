import 'package:finance_bank_app/core/base/service/base_service.dart';
import 'package:finance_bank_app/feature/home/model/home_response.dart';

abstract class IHomeService extends BaseService {
  IHomeService(super.networkManager);

  Future<HomeResponse?> getHome();
}

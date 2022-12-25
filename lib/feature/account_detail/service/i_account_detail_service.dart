import 'package:finance_bank_app/core/base/service/base_service.dart';
import 'package:finance_bank_app/feature/account_detail/model/account_detail_response.dart';

abstract class IAccountDetailService extends BaseService {
  IAccountDetailService(super.networkManager);

  Future<AccountDetailResponse?> accountDetailById(int index);
}

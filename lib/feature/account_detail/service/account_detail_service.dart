import 'package:finance_bank_app/feature/account_detail/model/account_detail_response.dart';
import 'package:finance_bank_app/feature/account_detail/service/i_account_detail_service.dart';
import 'package:finance_bank_app/product/init/storage/hive_manager.dart';

class AccountDetailService extends IAccountDetailService {
  AccountDetailService(super.networkManager);

  String get _accountDetailRoute => 'cardDetail/';

  @override
  Future<AccountDetailResponse?> accountDetailById(int index) async {
    final cacheModel = HiveManager.instance.getAccountDetailResponseModel();
    if (cacheModel != null && cacheModel.isNotExpired) {
      return cacheModel;
    }
    final response = await manager.send(
      '$_accountDetailRoute$index',
      responseModel: AccountDetailResponse(),
    );
    if (response != null) {
      HiveManager.instance.setAccountDetailResponseModel(response);
    }
    return response;
  }
}

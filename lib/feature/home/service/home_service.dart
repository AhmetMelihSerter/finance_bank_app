import 'package:finance_bank_app/feature/home/model/home_response.dart';
import 'package:finance_bank_app/feature/home/service/i_home_service.dart';
import 'package:finance_bank_app/product/init/storage/hive_manager.dart';

class HomeService extends IHomeService {
  HomeService(super.networkManager);

  String get _homeRoute => 'home/';

  @override
  Future<HomeResponse?> getHome() async {
    final cacheModel = HiveManager.instance.getHomeResponseModel();
    if (cacheModel != null && cacheModel.isNotExpired) {
      return cacheModel;
    }
    final response = await manager.send(
      _homeRoute,
      responseModel: HomeResponse(),
    );
    if (response != null) {
      HiveManager.instance.setHomeResponseModel(response);
    }
    return response;
  }
}

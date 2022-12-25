abstract class IUrlManager {
  Future<void> openUrl({required String url});
  Future<void> openStore({required String storeUrl});
  Future<void> openMap({required String mapUrl});
  Future<void> openSms({required String phone, required String text});
  Future<void> openWhatsApp({required String phone, required String text});
}

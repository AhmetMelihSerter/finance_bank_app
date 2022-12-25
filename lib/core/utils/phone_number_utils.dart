class PhoneNumberUtils {
  PhoneNumberUtils._();

  static String checkAndAddAreaCode(
    String phoneNumber, {
    String areaCode = '90',
  }) {
    final cleanPhone =
        phoneNumber.replaceAll(' ', '').replaceAll('(', '').replaceAll(')', '');
    if (cleanPhone.startsWith(areaCode)) {
      return cleanPhone;
    } else {
      return areaCode + cleanPhone;
    }
  }

  static String deleteAreaCode(String phoneNumber, {String areaCode = '90'}) {
    return phoneNumber.replaceAll(areaCode, '');
  }
}

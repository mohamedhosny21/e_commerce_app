class Utils {
  static String generateCountryFlag(String countryCode) {
    String flag = countryCode.toUpperCase().replaceAllMapped(
        RegExp(r'[A-Z]'),
        (Match match) =>
            String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
    return flag;
  }
}

import 'dart:developer';

class BaseUrlCheckUtil {
  static void baseUrlCheck(String baseUrl) {
    if (baseUrl.isNotEmpty) {
      log('base url loaded successfully: $baseUrl');
    } else {
      log('base url is empty, reverting to default: https://pokeapi.co/api/v2');
    }
  }
}

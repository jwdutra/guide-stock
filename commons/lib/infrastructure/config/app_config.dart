class AppConfigs {
  static String? url;

  static String urlBackend() {
    url ??= 'https://query2.finance.yahoo.com/v8/finance/chart/';

    return url!;
  }

  static setUrl(String url) {
    url = url;
  }
}

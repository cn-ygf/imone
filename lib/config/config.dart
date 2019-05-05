enum Env {
  PROD,
  DEV,
  LOCAL,
}

class Config{
  static Env env;
  static String get apiHost {
    switch (env) {
      case Env.PROD:
        return "https://im.onelic.com/api/v1/";
      case Env.DEV:
        return "https://dev.im.onelic.com/api/v1/";
      case Env.LOCAL:
        return "http://192.168.0.103:9000/api/v1/";
      default:
        return "https://im.onelic.com/api/v1/";
    }
  }
  static String sessionKey;
}
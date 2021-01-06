enum AppEnvironmentEnum {
  local,
  production,
  staging,
}

class AppEnvironment {
  static const environment = AppEnvironmentEnum.local;
}

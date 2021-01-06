import 'package:stacked_architecture_starter/app/config/environment.dart';

class ApiConfig {
  static getApiBaseUrl() {
    switch (AppEnvironment.environment) {
      case AppEnvironmentEnum.local:
        return 'http://10.0.2.2:8000';

      case AppEnvironmentEnum.production:
        return 'http://10.0.2.2:8000';

      default:
        return 'http://10.0.2.2:8000';
    }
  }
}

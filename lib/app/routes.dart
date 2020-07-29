import 'package:auto_route/auto_route_annotations.dart';

// Views
import '../ui/views/home/home_view.dart';
import '../ui/views/main/main_view.dart';
import '../ui/views/splash/splash_view.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(
      path: '/',
      page: SplashView,
      initial: true,
    ),
    MaterialRoute(
      path: '/main',
      page: MainView,
    ),
    MaterialRoute(
      path: '/home',
      page: HomeView,
    ),
  ],
)
class $Router {}

import 'package:flutter/material.dart';
import 'package:flutter_stacked_architecture_starter/app/ui/setup_snackbar_ui.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/locator.dart';
import 'app/routes.gr.dart' as appRouter;
import 'services/theme_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  setupSnackbarUi();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => AppViewModel(),
      builder: (context, model, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App',
        themeMode: model.themeMode,
        theme: model.themeData,
        navigatorKey: locator<NavigationService>().navigatorKey,
        onGenerateRoute: appRouter.Router().onGenerateRoute,
        initialRoute: appRouter.Routes.splashView,
      ),
    );
  }
}

class AppViewModel extends ReactiveViewModel {
  final _themeService = locator<ThemeService>();

  ThemeMode get themeMode => _themeService.theme;
  ThemeData get themeData => _themeService.isLight
      ? _themeService.lightTheme
      : _themeService.darkTheme;

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_themeService];
}

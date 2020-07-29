import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

// Views
import 'login/login_view.dart' show LoginView;
import 'register/register_view.dart' show RegisterView;

// ViewModel
import 'main_viewmodel.dart' show MainViewModel;

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => MainViewModel(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LoginView(),
              RegisterView(),
            ],
          ),
        ),
      ),
    );
  }
}

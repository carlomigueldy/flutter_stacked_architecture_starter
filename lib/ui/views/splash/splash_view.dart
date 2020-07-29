import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './splash_viewmodel.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      viewModelBuilder: () => SplashViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: FlutterLogo(),
            ),
          ),
        );
      },
    );
  }
}

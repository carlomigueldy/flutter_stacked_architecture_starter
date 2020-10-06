import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart' show HomeViewModel;

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Text(model.user.fullName ?? 'anonymous user'),
              ),
              RaisedButton(
                onPressed: () => model.logout(),
                child: Text('LOGOUT'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

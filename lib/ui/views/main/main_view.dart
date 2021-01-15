import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../theme/shapes.dart' show shape;

// Views
import 'login/login_view.dart' show LoginView;
import 'register/register_view.dart' show RegisterView;

// ViewModel
import 'main_viewmodel.dart' show MainViewModel, MenuType;

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => MainViewModel(),
      builder: (context, model, child) {
        return SafeArea(
          child: Scaffold(
            body: getMenuType(context: context, model: model),
          ),
        );
      },
    );
  }

  Widget getMenuType({
    @required BuildContext context,
    @required MainViewModel model,
  }) {
    // final screenSize = MediaQuery.of(context).size;

    if (model.menuType == MenuType.LOGIN) {
      return LoginView();
    } else if (model.menuType == MenuType.REGISTER) {
      return RegisterView();
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Center(
                child: Text(
                  'App',
                  style: TextStyle(
                    fontSize: 48,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Card(
                    child: ListTile(
                      title: Text(
                        'Login',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Login with your email and password'),
                      onTap: () => model.selectMenu(menuType: MenuType.LOGIN),
                      onLongPress: () {},
                      shape: shape,
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text(
                        'Register',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Create an account with us'),
                      onTap: () =>
                          model.selectMenu(menuType: MenuType.REGISTER),
                      onLongPress: () {},
                      shape: shape,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }
  }
}

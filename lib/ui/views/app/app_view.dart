import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';

// ViewModel
import '../../../models/user.dart';
import 'app_viewmodel.dart' show AppViewModel, MenuType;

class AppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppViewModel>.reactive(
      viewModelBuilder: () => AppViewModel(),
      builder: (context, model, child) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: InstagramLogo(),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 8.0),
                  child: Image.asset(
                    'assets/messenger-icon.png',
                    height: 25,
                    width: 25,
                  ),
                ),
              ],
            ),
            bottomNavigationBar: AppBottomNavigationBar(model: model),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  homeViewStories(model: model),
                  Divider(),
                  homeViewFeed()
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Container homeViewFeed() {
    return Container(
      height: 3000,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return Container(
            color: Colors.grey[200],
            height: 600,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(backgroundColor: Colors.green),
                          SizedBox(width: 10),
                          Text('Name')
                        ],
                      ),
                      Icon(Icons.more_vert)
                    ],
                  ),
                ),
                Container(
                  height: 350,
                  color: Colors.redAccent,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          FaIcon(FontAwesomeIcons.heart),
                          SizedBox(width: 15),
                          FaIcon(FontAwesomeIcons.comment),
                          SizedBox(width: 15),
                          FaIcon(FontAwesomeIcons.paperPlane),
                        ],
                      ),
                      FaIcon(FontAwesomeIcons.bookmark),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '20,594 likes',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: 10,
      ),
    );
  }

  Container homeViewStories({@required AppViewModel model}) {
    return Container(
      height: 80,
      // color: Colors.red,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          bool isFirst = index == 0;
          bool isLast = (model.users.length - 1) == index;
          User user = model.users[index];

          return Stack(
            children: [
              Positioned(
                child: Container(
                  // color: Colors.blue,
                  margin: isFirst
                      ? const EdgeInsets.only(left: 10)
                      : isLast
                          ? const EdgeInsets.only(right: 10)
                          : null,
                  height: 70,
                  width: 70,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(user.photoUrl),
                  ),
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 5),
        itemCount: 5,
      ),
    );
  }
}

class InstagramLogo extends StatelessWidget {
  const InstagramLogo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imagePath = 'assets/logos/instagram-logo.png';

    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class AppBottomNavigationBar extends StatelessWidget {
  final AppViewModel model;

  const AppBottomNavigationBar({
    Key key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedItemColor: Colors.black,
      backgroundColor: Colors.black,
      fixedColor: Colors.black,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: 2,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search_outlined),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_box_outlined),
          label: 'Add Photo',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.room_preferences_sharp),
          label: 'Likes',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined),
          label: 'Profile',
        ),
      ],
    );
  }
}

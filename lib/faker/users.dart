import 'dart:math';

import 'package:faker/faker.dart';
import 'package:slugify2/slugify.dart';

import '../models/photo.dart';
import '../models/photo_comment.dart';
import '../models/user.dart';

List<User> generateFakeUsers({int quantity}) {
  Faker faker = new Faker();
  // Slugify slugify = new Slugify();
  Random random = new Random();

  List<User> users = [];

  for (int i = 0; i < quantity; i++) {
    String fullName = faker.person.firstName() + ' ' + faker.person.lastName();
    String photoUrl = 'https://picsum.photos/200/300';
    // 'https://avatars.dicebear.com/4.5/api/avataaars/potato.svg';
    // 'https://avatars.dicebear.com/4.5/api/avataaars/' + fullName + '.svg';

    // List<User> followers = generateFakeUsers(quantity: 5);
    // List<User> following = generateFakeUsers(quantity: 3);

    User user = User(
      userId: faker.guid.toString(),
      category: faker.job.title(),
      description: faker.lorem.words(25).toString(),
      // followers: followers,
      // following: following,
      fullName: fullName,
      photoUrl: photoUrl,
    );

    generateFakePhotos({int quantity}) {
      List<Photo> photos = [];

      for (var i = 0; i < quantity; i++) {
        photos.add(Photo(
          photoUrl: 'https://picsum.photos/200/300',
          // likedBy: followers,
          comments: [
            // PhotoComment(
            //   photoCommentId: faker.guid.toString(),
            //   comment: faker.lorem.words(10).toString(),
            //   user: followers[random.nextInt(followers.length - 1)],
            // ),
          ],
        ));
      }

      return photos;
    }

    user.photos = generateFakePhotos(quantity: 5);

    users.add(user);
  }

  return users;
}

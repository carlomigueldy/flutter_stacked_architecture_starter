import 'package:injectable/injectable.dart';

import '../../models/user.dart' show User;
import 'base_service.dart' show BaseService;

@lazySingleton
class UserService implements BaseService<User> {
  @override
  String endpoint;

  @override
  Future<List<User>> fetchAll() {
    // TODO: implement fetchAll
    throw UnimplementedError();
  }

  @override
  Future<User> fetchById({int id}) {
    // TODO: implement fetchById
    throw UnimplementedError();
  }

  @override
  Future<User> requestCreate({User model}) {
    // TODO: implement requestCreate
    throw UnimplementedError();
  }

  @override
  Future<bool> requestDeleteById({int id}) {
    // TODO: implement requestDeleteById
    throw UnimplementedError();
  }

  @override
  Future<bool> requestForceDeleteById({int id}) {
    // TODO: implement requestForceDeleteById
    throw UnimplementedError();
  }

  @override
  Future<bool> requestRestoreById({int id}) {
    // TODO: implement requestRestoreById
    throw UnimplementedError();
  }

  @override
  Future<User> requestUpdate({User model, int id}) {
    // TODO: implement requestUpdate
    throw UnimplementedError();
  }
}

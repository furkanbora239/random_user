import 'package:flutter/widgets.dart';
import 'package:random_user/model.dart';
import 'package:random_user/service.dart';

class getUser with ChangeNotifier {
  late Future<RandomUser> _FutureRandomUser = getData();

  void resetApi() {
    getUser()._FutureRandomUser = getData();
    notifyListeners();
  }

  Future<RandomUser> get FutureRandomUser => _FutureRandomUser;
}

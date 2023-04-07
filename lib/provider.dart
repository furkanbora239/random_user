// ignore_for_file: camel_case_types, unused_element, non_constant_identifier_names

import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class urlChecker with ChangeNotifier {
  int numberOfPeopleToPull = 20;
  String _url =
      'https://randomuser.me/api/?password=special,upper,lower,number,8-14&results=20';

  final List<String> _nation = [
    'random',
    'AU',
    'BR',
    'CA',
    'CH',
    'DE',
    'DK',
    'ES',
    'FI',
    'FR',
    'GB',
    'IE',
    'IN',
    'IR',
    'MX',
    'NL',
    'NO',
    'NZ',
    'RS',
    'TR',
    'UA',
    'US'
  ];

  final List<String> _urlUpdater = ['random', 'random', 'strong'];

  /* void changeUrl() {
    getUser()._FutureRandomUser = getData();
    notifyListeners();
  } */

  List<String> get nation => _nation;

  List<String> get urlUpdater => _urlUpdater;

  String get url => _url;

  void urlUpdete() {
    String tempUrl = 'https://randomuser.me/api/?results=50&';
    String forPassword = '', forNation = '', forGender = '';
    if (_urlUpdater[2] != 'strong') {
      if (_urlUpdater[2] == 'medium') {
        forPassword = 'password=upper,lower,number,8-14';
      } else if (_urlUpdater[2] == 'weak') {
        forPassword = 'password=upper,lower,8-14';
      } else {
        forPassword = 'password=special,upper,lower,number,8-14';
      }
    } else {
      forPassword = 'password=special,upper,lower,number,8-14';
    }

    if (_urlUpdater[0] != 'random') {
      if (_urlUpdater[0] == 'female') {
        forGender = '&gender=female';
      } else if (_urlUpdater[0] == 'male') {
        forGender = '&gender=male';
      } else {
        forGender = '';
      }
    } else {
      forGender = '';
    }

    if (_urlUpdater[1] == 'random') {
      forNation = '';
    } else {
      forNation = '&nat=${_urlUpdater[1].toLowerCase()}';
    }

    tempUrl =
        'https://randomuser.me/api/?$forPassword$forGender$forNation&results=20';

    _url = tempUrl;
    notifyListeners();
  }
}

class UserList with ChangeNotifier {
  int userCounter = 0;

  int get _userCounter => userCounter;

  List<List> _FavList = [];

  List<List> get FavList => _FavList;

  Future<void> addFavUser() async {
    if (_FavList.isEmpty) {
      throw Exception('fav user list is emty');
    } else {
      final prefs = await SharedPreferences.getInstance();
      checkCounter();

      prefs.setStringList(
          'favUserInfo$userCounter', _FavList[userCounter] as List<String>);
      userCounter++;

      prefs.setInt('userCounter', userCounter);

      notifyListeners();
    }
  }

  Future<void> getFavUser() async {
    final prefs = await SharedPreferences.getInstance();
    checkCounter();

    for (int index = 0; index < userCounter; index++) {
      List<dynamic> emty = [];
      for (int i = 0; i < 20; i++) {
        emty.add('null');
      }
      _FavList.add(prefs.getStringList('favUserInfo$index') ?? emty);
    }
    notifyListeners();
  }

  Future<void> checkCounter() async {
    final prefs = await SharedPreferences.getInstance();
    userCounter = prefs.getInt('userCounter') ?? 0;
  }

  Future<void> deleteOneUser(int UserNumber) async {
    final prefs = await SharedPreferences.getInstance();
    checkCounter();
    _FavList.removeAt(UserNumber);

    for (int index = 0; index < userCounter; index++) {
      if (index < _FavList.length) {
        prefs.setStringList(
            'favUserInfo$index', _FavList[index] as List<String>);
      } else {
        prefs.remove('favUserInfo$index');
      }
    }

    prefs.setInt('userCounter', _FavList.length);

    notifyListeners();
  }

  Future<void> deleteAll() async {
    final prefs = await SharedPreferences.getInstance();
    _FavList = [];
    for (; userCounter > 0; userCounter--) {
      prefs.remove('favUserInfo$userCounter');
    }
    _FavList = [];
    prefs.remove('userCount');
    notifyListeners();
  }
}

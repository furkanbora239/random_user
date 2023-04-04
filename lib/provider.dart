import 'package:flutter/widgets.dart';

class urlChecker with ChangeNotifier {
  String _url =
      'https://randomuser.me/api/?password=special,upper,lower,number,8-14';

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
    String tempUrl = 'https://randomuser.me/api/?';
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

    tempUrl = 'https://randomuser.me/api/?$forPassword$forGender$forNation';

    _url = tempUrl;
    notifyListeners();
  }
}

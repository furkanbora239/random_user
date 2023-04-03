import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:random_user/model.dart';

String url =
    'https://randomuser.me/api/?password=special,upper,lower,number,8-14';

Future<RandomUser> getData() async {
  final res = await http.get(Uri.parse(url));
  if (res.statusCode == 200) {
    return RandomUser.fromJson(jsonDecode(res.body));
  } else {
    throw Exception('error code ${res.statusCode}');
  }
}

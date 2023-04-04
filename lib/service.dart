import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:random_user/main.dart';
import 'package:random_user/model.dart';
import 'package:random_user/provider.dart';

Future<RandomUser> getData() async {
  final res = await http.get(Uri.parse(urlChecker().url));
  print('url from service: ${urlChecker().url}');
  if (res.statusCode == 200) {
    return RandomUser.fromJson(jsonDecode(res.body));
  } else {
    throw Exception('error code ${res.statusCode}');
  }
}

Widget build(BuildContext context) {
  Future<RandomUser> getData() async {
    final res = await http.get(Uri.parse(context.read<urlChecker>().url));
    print('url2 from service: ${urlChecker().url}');
    if (res.statusCode == 200) {
      return RandomUser.fromJson(jsonDecode(res.body));
    } else {
      throw Exception('error code ${res.statusCode}');
    }
  }

  return getData() as Widget;
}

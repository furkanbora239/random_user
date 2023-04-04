import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:random_user/main.dart';
import 'package:random_user/model.dart';
import 'package:random_user/provider.dart';

Future<RandomUser> getData(BuildContext context) async {
  final res = await http.get(Uri.parse(context.watch<urlChecker>().url));
  if (res.statusCode == 200) {
    return RandomUser.fromJson(jsonDecode(res.body));
  } else {
    throw Exception('error code ${res.statusCode}');
  }
}

// ignore_for_file: use_build_context_synchronously, camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_user/componends/Drawer.dart';
import 'package:random_user/componends/card.dart';
import 'package:random_user/componends/endDrawe.dart';
import 'package:random_user/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => urlChecker()),
    ChangeNotifierProvider(create: (_) => UserList())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.yellow,
      ),
      home: const ux(),
    );
  }
}

class ux extends StatefulWidget {
  const ux({super.key});

  @override
  State<ux> createState() => _uxState();
}

class _uxState extends State<ux> {
  @override
  void initState() {
    // TODO: implement initState

    context.read<UserList>().checkCounter();

    context.read<UserList>().getFavUser();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        endDrawer: myEndDrawer(),
        // left drawer for more info and some flliter
        drawer: myDrawer(),
        body: SafeArea(child: UserCard()));
  }
}

// it is what it is
Widget GreyLine() {
  return const SizedBox(
    height: 20,
    child: Divider(
      indent: 30,
      endIndent: 30,
      color: Colors.grey,
    ),
  );
}

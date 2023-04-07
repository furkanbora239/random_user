// ignore_for_file: use_build_context_synchronously, camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_user/componends/Drawer.dart';
import 'package:random_user/componends/endDrawe.dart';
import 'package:random_user/model.dart';
import 'package:random_user/provider.dart';
import 'package:random_user/service.dart';

import 'componends/googleLikeBox.dart';

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
      debugShowCheckedModeBanner: false,
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
        primarySwatch: Colors.blueGrey,
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
    final ValueNotifier<bool> isItPress = ValueNotifier(false);
    return Scaffold(
      endDrawer: const myEndDrawer(),
      // left drawer for more info and some flliter
      drawer: const myDrawer(),
      floatingActionButton: FloatingActionButton(
          // yenileme buttonu
          tooltip: 'refresh',
          child: const FittedBox(
              child: Icon(
            Icons.refresh_rounded,
          )),
          onPressed: () {
            setState(() {
              /*  içerisinde bir fonksiyon olmasada 
            düymeye basıldığında widget genilendiği yani setstate edildiği için 
            card yinede yenileniyor  */
            });
          }),
      body: SafeArea(
          child: FutureBuilder<RandomUser>(
        future: getData(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            String pp = '${snapshot.data!.results!.first!.picture!.large}',
                firstName = '${snapshot.data!.results!.first!.name!.first}',
                lestName = '${snapshot.data!.results!.first!.name!.last}',
                cellPhoneNumber = '${snapshot.data!.results!.first!.phone}',
                email = '${snapshot.data!.results!.first!.email}',
                userName = '${snapshot.data!.results!.first!.login!.username}',
                password = '${snapshot.data!.results!.first!.login!.password}',
                street =
                    '${snapshot.data!.results!.first!.location!.street!.name}',
                city = '${snapshot.data!.results!.first!.location!.city}',
                state = '${snapshot.data!.results!.first!.location!.state}',
                country = '${snapshot.data!.results!.first!.location!.country}',
                postCode =
                    '${snapshot.data!.results!.first!.location!.postcode}';

            List<String> RandomUserData = [
              pp,
              firstName,
              lestName,
              cellPhoneNumber,
              email,
              userName,
              password,
              street,
              city,
              state,
              country,
              postCode
            ];

            return Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  border: Border.all(width: 3, color: Colors.black),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //görsel random userın fotosu olacak
                  Padding(
                    //    <===== top container
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 1),
                      decoration: BoxDecoration(
                          //backgroundBlendMode: BlendMode.clear, ====>gradien istiyormuş halledersin bir ara
                          //color: Colors.black,
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                              topLeft: Radius.circular(4),
                              topRight: Radius.circular(4))),
                      child: Row(
                        children: [
                          Expanded(
                              child: GestureDetector(
                            onTap: () {
                              Scaffold.of(context).openDrawer();
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.black, shape: BoxShape.circle),
                              child: const Icon(
                                Icons.more_vert,
                                color: Colors.white,
                                //    size: MediaQuery.of(context).size.width / 8,
                              ),
                            ),
                          )),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 15.0),
                              child: CircleAvatar(
                                radius: MediaQuery.of(context).size.height / 9,
                                backgroundColor: Colors.black,
                                child: CircleAvatar(
                                  radius:
                                      MediaQuery.of(context).size.height / 10,
                                  foregroundImage: NetworkImage(pp),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ValueListenableBuilder<bool>(
                                valueListenable: isItPress,
                                builder: (context, val, child) {
                                  // user fav star button is here
                                  return GestureDetector(
                                    onLongPress: () {
                                      Scaffold.of(context).openEndDrawer();
                                    },
                                    onTap: () {
                                      isItPress.value = !isItPress.value;
                                      if (isItPress.value == true) {
                                        context
                                            .read<UserList>()
                                            .FavList
                                            .add(RandomUserData);
                                        context.read<UserList>().addFavUser();
                                      } else if (isItPress.value == false) {
                                        if (RandomUserData ==
                                            context
                                                .read<UserList>()
                                                .FavList
                                                .last) {
                                          context
                                              .read<UserList>()
                                              .deleteOneUser(context
                                                      .read<UserList>()
                                                      .FavList
                                                      .length -
                                                  1);
                                        }
                                      }
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          color: Colors.black,
                                          shape: BoxShape.circle),
                                      child: Icon(
                                        Icons.star_rounded,
                                        color: isItPress.value == true
                                            ? Colors.yellow
                                            : Colors.white,
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //random userın adı ve soy adı yazacak
                  Expanded(
                    child: ListView(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: BoxLikeGoogleUi(
                                    hadder: 'First Name', content: firstName)),
                            Expanded(
                                child: BoxLikeGoogleUi(
                                    hadder: 'Last Name', content: lestName))
                          ],
                        ),
                        //iletişim bilgileri
                        BoxLikeGoogleUi(
                            hadder: 'Phone Number', content: cellPhoneNumber),
                        GreyLine(),
                        //kullanıcı adı şifre gibi bilgiler
                        BoxLikeGoogleUi(hadder: 'e - mail', content: email),
                        BoxLikeGoogleUi(hadder: 'User Name', content: userName),
                        BoxLikeGoogleUi(hadder: 'Password', content: password),
                        GreyLine(),
                        //en altta adres vs...
                        Row(
                          children: [
                            Expanded(
                                child: BoxLikeGoogleUi(
                                    hadder: 'Street', content: street)),
                            Expanded(
                                child: BoxLikeGoogleUi(
                                    hadder: 'City', content: city)),
                          ],
                        ),
                        BoxLikeGoogleUi(hadder: 'State', content: state),
                        Row(
                          children: [
                            Expanded(
                              child: BoxLikeGoogleUi(
                                content: country,
                                hadder: 'Country',
                              ),
                            ),
                            Expanded(
                                child: BoxLikeGoogleUi(
                                    hadder: 'Post Code', content: postCode)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Center(child: CircularProgressIndicator());
        },
      )),
    );
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

// ignore_for_file: non_constant_identifier_names

import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:random_user/service.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../model.dart';
import '../provider.dart';
import 'googleLikeBox.dart';

class UserCard extends StatefulWidget {
  const UserCard({super.key});

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isItPress = ValueNotifier(false);

    return FutureBuilder<RandomUser>(
      future: getData(context),
      builder: (context, snapshot) {
        List<List> getUserList = [];
        if (snapshot.hasData) {
          for (var listOfPull in snapshot.data!.results!) {
            String pp = '${listOfPull!.picture!.large}',
                firstName = '${listOfPull.name!.first}',
                lestName = '${listOfPull.name!.last}',
                cellPhoneNumber = '${listOfPull.phone}',
                email = '${listOfPull.email}',
                userName = '${listOfPull.login!.username}',
                password = '${listOfPull.login!.password}',
                street = '${listOfPull.location!.street!.name}',
                city = '${listOfPull.location!.city}',
                state = '${listOfPull.location!.state}',
                country = '${listOfPull.location!.country}',
                postCode = '${listOfPull.location!.postcode}';

            List<String> xList = [
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

            getUserList.add(xList);
          }

          Future<void> deneme() async {
            var data = await getData(context);
            for (var element in data.results!) {
              String pp = '${element!.picture!.large}',
                  firstName = '${element.name!.first}',
                  lestName = '${element.name!.last}',
                  cellPhoneNumber = '${element.phone}',
                  email = '${element.email}',
                  userName = '${element.login!.username}',
                  password = '${element.login!.password}',
                  street = '${element.location!.street!.name}',
                  city = '${element.location!.city}',
                  state = '${element.location!.state}',
                  country = '${element.location!.country}',
                  postCode = '${element.location!.postcode}';

              List<String> xList = [
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
              getUserList.add(xList);
            }
          }

          return AppinioSwiper(
              onEnd: () {
                setState(() {
                  deneme();
                });
              },
              swipeOptions: AppinioSwipeOptions.horizontal,
              cardsBuilder: (context, index) {
                List<String> RandomUserData =
                    getUserList[index] as List<String>;
                return Container(
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Theme.of(context).canvasColor,
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
                                      color: Colors.black,
                                      shape: BoxShape.circle),
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
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15.0),
                                  child: CircleAvatar(
                                    radius:
                                        MediaQuery.of(context).size.height / 9,
                                    backgroundColor: Colors.black,
                                    child: CircleAvatar(
                                      radius:
                                          MediaQuery.of(context).size.height /
                                              10,
                                      foregroundImage:
                                          NetworkImage(RandomUserData[0]),
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
                                            context
                                                .read<UserList>()
                                                .addFavUser();
                                          } else if (isItPress.value == false) {
                                            context
                                                .read<UserList>()
                                                .deleteOneUser(context
                                                        .read<UserList>()
                                                        .FavList
                                                        .length -
                                                    1);
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
                                        hadder: 'First Name',
                                        content: RandomUserData[1])),
                                Expanded(
                                    child: BoxLikeGoogleUi(
                                        hadder: 'Last Name',
                                        content: RandomUserData[2]))
                              ],
                            ),
                            //iletişim bilgileri
                            BoxLikeGoogleUi(
                                hadder: 'Phone Number',
                                content: RandomUserData[3]),
                            GreyLine(),
                            //kullanıcı adı şifre gibi bilgiler
                            BoxLikeGoogleUi(
                                hadder: 'e - mail', content: RandomUserData[4]),
                            BoxLikeGoogleUi(
                                hadder: 'User Name',
                                content: RandomUserData[5]),
                            BoxLikeGoogleUi(
                                hadder: 'Password', content: RandomUserData[6]),
                            GreyLine(),
                            //en altta adres vs...
                            Row(
                              children: [
                                Expanded(
                                    child: BoxLikeGoogleUi(
                                        hadder: 'Street',
                                        content: RandomUserData[7])),
                                Expanded(
                                    child: BoxLikeGoogleUi(
                                        hadder: 'City',
                                        content: RandomUserData[8])),
                              ],
                            ),
                            BoxLikeGoogleUi(
                                hadder: 'State', content: RandomUserData[9]),
                            Row(
                              children: [
                                Expanded(
                                  child: BoxLikeGoogleUi(
                                    content: RandomUserData[10],
                                    hadder: 'Country',
                                  ),
                                ),
                                Expanded(
                                    child: BoxLikeGoogleUi(
                                        hadder: 'Post Code',
                                        content: RandomUserData[11])),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              cardsCount: getUserList.length);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_user/componends/googleLikeBox.dart';
import 'package:random_user/main.dart';

import '../provider.dart';

class seeUserInfoPage extends StatelessWidget {
  final int index;
  const seeUserInfoPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var shortOne = context.read<UserList>().FavList[index];
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            '${context.read<UserList>().FavList[index][1]} ${context.read<UserList>().FavList[index][2]}',
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
        body: Container(
          foregroundDecoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          margin: const EdgeInsets.all(10),
          child: ListView(children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: MediaQuery.of(context).size.width / 7,
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).size.width / 7.5,
                      foregroundImage: NetworkImage(shortOne[0]),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BoxLikeGoogleUi(
                          hadder: 'First Name', content: shortOne[1]),
                      BoxLikeGoogleUi(
                          hadder: 'Last Name', content: shortOne[2]),
                    ],
                  ),
                )
              ],
            ),
            BoxLikeGoogleUi(hadder: 'Phone Number', content: shortOne[3]),
            GreyLine(),
            BoxLikeGoogleUi(hadder: 'E - Mail', content: shortOne[4]),
            BoxLikeGoogleUi(hadder: 'Username', content: shortOne[5]),
            BoxLikeGoogleUi(hadder: 'Password', content: shortOne[6]),
            GreyLine(),
            Row(
              children: [
                Expanded(
                    child: BoxLikeGoogleUi(
                        hadder: 'Street', content: shortOne[7])),
                Expanded(
                    child:
                        BoxLikeGoogleUi(hadder: 'City', content: shortOne[8])),
              ],
            ),
            BoxLikeGoogleUi(hadder: 'State', content: shortOne[9]),
            Row(
              children: [
                Expanded(
                  child: BoxLikeGoogleUi(
                    content: shortOne[10],
                    hadder: 'Country',
                  ),
                ),
                Expanded(
                    child: BoxLikeGoogleUi(
                        hadder: 'Post Code', content: shortOne[11])),
              ],
            ),
          ]),
        ));
  }
}

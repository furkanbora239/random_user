import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_user/provider.dart';

class myEndDrawer extends StatelessWidget {
  const myEndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SafeArea(
            child: context.read<UserList>().FavList.isEmpty
                ? const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'fav user not founded',
                      textAlign: TextAlign.center,
                    ),
                  )
                : Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${context.read<UserList>().FavList.length} fav user founded',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  context.read<UserList>().deleteAll();
                                },
                                child: const Text('delete all favs')),
                          )
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.black),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(50))),
                              child: ListTile(
                                dense: true,
                                style: ListTileStyle.drawer,
                                enabled: true,
                                subtitle:
                                    Text(userComponent(index, 5, context)),
                                leading: CircleAvatar(
                                    foregroundImage: NetworkImage(
                                        userComponent(index, 0, context))),
                                title: Text(
                                  '${userComponent(index, 1, context)} ${userComponent(index, 2, context)}',
                                  style: const TextStyle(color: Colors.red),
                                ),
                              ),
                            );
                          },
                          itemCount: context.read<UserList>().FavList.length,
                        ),
                      )
                    ],
                  )));
  }
}

String userComponent(index, number, BuildContext context) {
  return context.read<UserList>().FavList[index][number];
}

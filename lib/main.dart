// ignore_for_file: use_build_context_synchronously, camel_case_types

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_user/model.dart';
import 'package:random_user/provider.dart';
import 'package:random_user/service.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => urlChecker())],
      child: const MyApp()));
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
        primarySwatch: Colors.blue,
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
  String dropDownSelectionGender = 'random',
      dropDownSelectionNations = 'random',
      dropDownSelectionPassword = 'strong';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Expanded(
                    child: Text(
                  'Gander',
                  textAlign: TextAlign.right,
                )),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: DropdownButton<String>(
                      value: dropDownSelectionGender,
                      items: const [
                        DropdownMenuItem(
                          value: 'random',
                          child: Text('Random'),
                        ),
                        DropdownMenuItem(
                          value: 'female',
                          child: Text('Female'),
                        ),
                        DropdownMenuItem(
                          value: 'male',
                          child: Text('Male'),
                        ),
                      ],
                      onChanged: ((String? newValue) {
                        setState(() {
                          dropDownSelectionGender = newValue!;
                          context.read<urlChecker>().urlUpdater[0] = newValue;
                          context.read<urlChecker>().urlUpdete();
                          print(context.read<urlChecker>().urlUpdater[0]);
                          print(context.read<urlChecker>().url);
                        });
                      })),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Expanded(
                    child: Text(
                  'Nations',
                  textAlign: TextAlign.right,
                )),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: DropdownButton<String>(
                      value: dropDownSelectionNations,
                      items: context
                          .read<urlChecker>()
                          .nation
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: ((String? newValue) {
                        setState(() {
                          dropDownSelectionNations = newValue!;
                        });
                      })),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Expanded(
                    child: Text(
                  'Password',
                  textAlign: TextAlign.right,
                )),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: DropdownButton<String>(
                      value: dropDownSelectionPassword,
                      items: const [
                        DropdownMenuItem(
                          value: 'strong',
                          child: Text('Strong'),
                        ),
                        DropdownMenuItem(
                          value: 'medium',
                          child: Text('Medium'),
                        ),
                        DropdownMenuItem(
                          value: 'weak',
                          child: Text('Weak'),
                        ),
                      ],
                      onChanged: ((String? newValue) {
                        setState(() {
                          dropDownSelectionPassword = newValue!;
                          context.read<urlChecker>().urlUpdater[2] = newValue;
                          context.read<urlChecker>().urlUpdete();
                          print(context.read<urlChecker>().urlUpdater[2]);
                          print(context.read<urlChecker>().url);
                        });
                      })),
                )
              ],
            ),
            const Expanded(child: SizedBox()),
            //const SizedBox.expand()
            TextButton(
                onPressed: () {
                  const Duration(milliseconds: 100);
                  showAboutDialog(
                    context: context,
                    applicationName: 'Random User',
                  );
                },
                child: const Text('More Info')),
          ],
        )),
      ),
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
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            String firstName = '${snapshot.data!.results!.first!.name!.first}',
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
                                  foregroundImage: NetworkImage(
                                      '${snapshot.data!.results!.first!.picture!.large}'),
                                ),
                              ),
                            ),
                          ),
                          const Expanded(child: Icon(Icons.star))
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

//    its a widgt for google like container
class BoxLikeGoogleUi extends StatefulWidget {
  final String hadder, content;
  const BoxLikeGoogleUi(
      {super.key, required this.hadder, required this.content});

  @override
  State<BoxLikeGoogleUi> createState() => _BoxLikeGoogleUiState();
}

class _BoxLikeGoogleUiState extends State<BoxLikeGoogleUi> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: const Alignment(-0.8, -1.5),
        children: [
          Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.black),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.content,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await Clipboard.setData(
                          ClipboardData(text: widget.content));
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          duration: Duration(milliseconds: 300),
                          content: Text('copied to clipboard')));
                    },
                    child: const Icon(Icons.copy),
                  )
                ],
              )),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).canvasColor),
            child: Text(' ${widget.hadder} '),
          )
        ],
      ),
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

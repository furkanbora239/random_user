// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider.dart';

class myDrawer extends StatefulWidget {
  const myDrawer({super.key});

  @override
  State<myDrawer> createState() => _myDrawerState();
}

class _myDrawerState extends State<myDrawer> {
  String dropDownSelectionGender = 'random',
      dropDownSelectionNations = 'random',
      dropDownSelectionPassword = 'strong';

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                        context.read<urlChecker>().urlUpdater[1] = newValue;
                        context.read<urlChecker>().urlUpdete();
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
    );
  }
}

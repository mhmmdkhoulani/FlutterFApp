// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:Cardjy/randomizer_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RandomizerPage extends StatelessWidget {
  RandomizerPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Randomaizer')),
      body: Center(
        child: Consumer<RandomizerChangeNotifier>(
          builder: (context, notifier, child) {
            return Text(
              notifier.getGeneratedNumber?.toString() ?? 'Generate a number',
              style: TextStyle(fontSize: 30, color: Colors.redAccent),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Generate'),
        onPressed: () {
          context.read<RandomizerChangeNotifier>().generateRandomNumber();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

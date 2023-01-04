// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:Cardjy/main.dart';
import 'package:Cardjy/randomizer_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RandomizerPage extends ConsumerWidget {
  RandomizerPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final randomizer = ref.watch(randomizerProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Randomaizer')),
      body: Center(
        child: Text(
          randomizer.getGeneratedNumber?.toString() ?? 'Generate a number',
          style: TextStyle(fontSize: 30, color: Colors.redAccent),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Generate'),
        onPressed: () {
          ref.read(randomizerProvider).generateRandomNumber();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

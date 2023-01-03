// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RandomizerPage extends HookWidget {
  final int min, max;
  final randomGenerator = Random();

  RandomizerPage({
    Key? key,
    required this.max,
    required this.min,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final generatedNumber = useState<int?>(null);
    return Scaffold(
      appBar: AppBar(title: Text('Randomaizer')),
      body: Center(
        child: Text(
          generatedNumber.value?.toString() ?? 'Generate a number',
          style: TextStyle(fontSize: 30, color: Colors.redAccent),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Generate'),
        onPressed: () {
          generatedNumber.value = min + randomGenerator.nextInt(max + 1 - min);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

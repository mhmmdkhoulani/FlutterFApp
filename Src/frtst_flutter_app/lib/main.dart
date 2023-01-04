import 'package:Cardjy/randomizer_change_notifier.dart';
import 'package:Cardjy/range_selector_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const AppWidget());
}

final randomizerProvider =
    ChangeNotifierProvider((ref) => RandomizerChangeNotifier());
 
class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Radndomizer',
        home: RangeSelectorPage(),
      ),
    );
  }
}

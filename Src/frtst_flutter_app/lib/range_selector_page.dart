import 'package:Cardjy/randomizer_page.dart';
import 'package:Cardjy/range_selector_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class RangeSelectorPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  RangeSelectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Range'),
      ),
      body: RangeSelectorForm(
        formKey: formKey,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (formKey.currentState?.validate() == true) {
            formKey.currentState?.save();
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => RandomizerPage()));
          }
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}

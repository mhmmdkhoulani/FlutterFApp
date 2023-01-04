import 'package:Cardjy/randomizer_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

typedef InValueSetter = void Function(int value);

class RangeSelectorForm extends StatelessWidget {
  const RangeSelectorForm({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(19),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RangeSelectorInputFormField(
              lableText: 'Minimum',
              intValueSetter: (value) =>
                  context.read<RandomizerChangeNotifier>().min = value,
            ),
            const SizedBox(
              height: 20,
            ),
            RangeSelectorInputFormField(
              lableText: 'Maximum',
              intValueSetter: (value) =>
                  context.read<RandomizerChangeNotifier>().max = value,
            ),
          ],
        ),
      ),
    );
  }
}

class RangeSelectorInputFormField extends StatelessWidget {
  const RangeSelectorInputFormField({
    Key? key,
    required this.lableText,
    required this.intValueSetter,
  }) : super(key: key);

  final String lableText;
  final InValueSetter intValueSetter;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration:
          InputDecoration(border: OutlineInputBorder(), labelText: lableText),
      keyboardType:
          TextInputType.numberWithOptions(decimal: false, signed: true),
      onSaved: (newValue) => intValueSetter(int.parse(newValue ?? '')),
      validator: (value) {
        if (value == null || int.tryParse(value) == null) {
          return 'This must be an integet';
        } else {
          return null;
        }
      },
    );
  }
}

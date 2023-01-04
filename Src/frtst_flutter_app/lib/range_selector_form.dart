import 'package:Cardjy/main.dart';
import 'package:Cardjy/randomizer_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef InValueSetter = void Function(int value);

class RangeSelectorForm extends ConsumerWidget {
  const RangeSelectorForm({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final randomaizer = ref.watch(randomizerProvider);
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
                  ref.read(randomizerProvider.notifier).setMin(value),
            ),
            const SizedBox(
              height: 20,
            ),
            RangeSelectorInputFormField(
              lableText: 'Maximum',
              intValueSetter: (value) =>
                  ref.read(randomizerProvider.notifier).setMax(value),
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

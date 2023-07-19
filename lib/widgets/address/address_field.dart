import 'package:flutter/material.dart';

class AddressField extends StatelessWidget {
  const AddressField({super.key, required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      style: TextStyle(
        color: Theme.of(context).colorScheme.primary,
      ),
      initialValue: value,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
          label: Text(label),
          border: const OutlineInputBorder()),
    );
  }
}

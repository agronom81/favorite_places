import 'package:favorite_places/data/places.dart';
import 'package:favorite_places/models/place_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: must_be_immutable
class NewPlaceScreen extends ConsumerWidget {
  NewPlaceScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  var _enteredName = '';

  void _saveItem(context, ref) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ref.read(placeProvider.notifier).addPlace(PlaceItem(_enteredName));
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Place added as a favorite',
          ),
        ),
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add new place')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(children: [
            TextFormField(
              maxLength: 100,
              decoration: const InputDecoration(
                label: Text('Place name'),
              ),
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    value.trim().length <= 1 ||
                    value.trim().length > 100) {
                  return 'Must be between 1 and 100 characters.';
                }
                return null;
              },
              onSaved: (value) {
                _enteredName = value!;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      _saveItem(context, ref);
                    },
                    child: const Text('Add place'))
              ],
            )
          ]),
        ),
      ),
    );
  }
}

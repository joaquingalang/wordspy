import 'package:flutter/material.dart';
import 'package:wordspy/utils/constants.dart';
import 'package:wordspy/widgets/outline_text_field.dart';
import 'package:wordspy/widgets/color_button.dart';

class AddWordSheet extends StatelessWidget {
  AddWordSheet({super.key, required this.onSubmit});

  final void Function(String) onSubmit;
  final TextEditingController _addWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        width: double.infinity,
        height: 250,
        decoration: BoxDecoration(
          color: kCreamColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            spacing: 15,
            children: [
              Text('New Word', style: kLargeTextStyle),
              OutlineTextField(
                controller: _addWordController,
              ),
              ColorButton(
                title: 'ADD',
                onPressed: () {
                  onSubmit(_addWordController.text.toUpperCase());
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

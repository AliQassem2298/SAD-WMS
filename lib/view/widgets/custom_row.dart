// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:warehouse_manegment_system/model/models/user_model.dart';

class CustomRow extends StatefulWidget {
  final String text;
  final String hintText;
  UserModel? userModel;
  CustomRow({
    super.key,
    required this.text,
    required this.hintText,
    required this.userModel,
  });

  @override
  State<CustomRow> createState() => _CustomRowState();
}

class _CustomRowState extends State<CustomRow> {
  bool isEditing = false;
  String enteredText = '';

  void toggleEditing() {
    setState(() {
      isEditing = !isEditing;
    });
  }

  void updateEnteredText(String text) {
    setState(() {
      enteredText = text;
    });
  }

  void saveChanges() {
    setState(() {
      isEditing = false;
    });
  }

  @override
  void initState() {
    super.initState();
    enteredText = widget.text;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Visibility(
          visible: !isEditing,
          child: Text(
            enteredText.isNotEmpty ? enteredText : widget.text,
            style: const TextStyle(
              color: Color(0xffBB1636),
              fontSize: 18,
            ),
          ),
        ),
        Visibility(
          visible: isEditing,
          child: Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: TextField(
                onSubmitted: (text) {
                  toggleEditing();
                  // saveChanges();
                },
                onChanged: updateEnteredText,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: toggleEditing,
          icon: isEditing
              ? const Icon(
                  Icons.done,
                  color: Color(0xffBB1636),
                )
              : const Icon(
                  Icons.auto_fix_high_outlined,
                  color: Color(0xff591C3C),
                ),
        ),
      ],
    );
  }
}

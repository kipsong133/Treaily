import 'package:flutter/material.dart';

InputDecoration BorderTextFieldDecoration() {
  return const InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.never,
      labelText: '보물 검색',
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 3, color: Colors.white),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 3, color: Colors.white),
      ));
}
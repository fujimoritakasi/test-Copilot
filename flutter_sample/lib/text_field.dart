import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200,
        child:
            const TextField(decoration: InputDecoration(labelText: "名前入力欄")));
  }
}

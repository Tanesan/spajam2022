import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 350,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            spreadRadius: 2,
            blurRadius: 8,
            color: Colors.grey.withOpacity(0.5),
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: TextFormField(
          decoration: InputDecoration(
        fillColor: Colors.white,
        focusColor: Colors.white,
        suffix: Text('確定'),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Color(0xffEBEBEB),
          ),
        ),
        helperStyle: Theme.of(context)
            .textTheme
            .headline5
            ?.copyWith(color: Color(0xffC0C0C0)),
        hintText: 'ルームIDを入力',
      )),
    );
  }
}

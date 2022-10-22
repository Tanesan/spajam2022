import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final String? suffix;
  final String hintText;
  final Function? onPressed;

  TextFieldCustom(
      {Key? key, this.suffix, this.onPressed, required this.hintText})
      : super(key: key);

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
        suffix: TextButton(
            child: Text(this.suffix ?? ""), onPressed: () => onPressed ?? null),
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
        hintText: this.hintText,
      )),
    );
  }
}

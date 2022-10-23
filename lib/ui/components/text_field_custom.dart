import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final String hintText;
  final void Function() onPressed;
  final String? suffix;
  final Widget? prefixIcon;
  final TextEditingController? controller;

  const TextFieldCustom({
    required this.onPressed,
    required this.hintText,
    this.suffix,
    this.prefixIcon,
    this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            spreadRadius: 2,
            blurRadius: 8,
            color: Colors.grey.withOpacity(0.5),
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Color(0xffEBEBEB),
            ),
          ),
          contentPadding: const EdgeInsets.fromLTRB(14, 10, 0, 10),
          prefixIcon: prefixIcon,
          fillColor: Colors.white,
          filled: true,
          focusColor: Colors.white,
          suffix: TextButton(
            onPressed: onPressed,
            child: Text(
              suffix ?? "",
              style: Theme.of(context).textTheme.button,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xffEBEBEB)),
          ),
          helperStyle: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(color: const Color(0xffEBEBEB)),
          hintText: hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyText1
              ?.copyWith(color: const Color.fromARGB(255, 196, 196, 196)),
        ),
      ),
    );
  }
}

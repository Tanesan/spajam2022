import 'package:flutter/material.dart';
import 'package:spajam2022/ui/styles/app_color.dart';

class HeaderCustomized extends StatelessWidget {
  final String title;

  const HeaderCustomized({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.primary,
      padding: const EdgeInsets.fromLTRB(10, 40, 10, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () => Navigator.pop(context),
                iconSize: 20,
              ),
              const IconButton(
                icon: Icon(Icons.settings, color: Colors.white),
                onPressed: null, // TODO: Go to setting page.
                iconSize: 20,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

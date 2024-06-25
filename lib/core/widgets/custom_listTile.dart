// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants.dart';
import 'package:flutter_application_2/core/helpers/extensions.dart';

import '../../features/Home/presentation/view/preview_view.dart';
import '../routing/routes.dart';

class CustomListTile extends StatefulWidget {
  const CustomListTile({
    super.key,
    required this.listtilename,
    this.onPressed,
  });
  final String listtilename;
  final void Function()? onPressed;

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14, right: 12, bottom: 15),
      child: Container(
        height: 55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: kHentGrayColor)),
        child: ListTile(
          onTap: widget.onPressed,
          trailing: const Icon(
            Icons.keyboard_arrow_right_sharp,
            size: 25,
            color: Colors.black,
          ),
          title: Text(
            widget.listtilename,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}

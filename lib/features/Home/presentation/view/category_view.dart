// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants.dart';

class CategoryCard extends StatelessWidget {
  String categoryName;
  String categoryImageUrl;
  final VoidCallback onPressed;

  CategoryCard({
    super.key,
    required this.categoryName,
    required this.categoryImageUrl,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: InkSplash.splashFactory,
      splashColor: Color.fromARGB(255, 181, 219, 250),
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.all(7),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(2, 2),
            )
          ],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Color.fromARGB(122, 118, 214, 255),
          ),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(categoryImageUrl),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              categoryName,
              style: TextStyle(
                fontSize: 13.3,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ]),
      ),
    );
  }
}

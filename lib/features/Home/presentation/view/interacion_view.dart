// ignore_for_file: prefer_const_constructors, empty_constructor_bodies, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants.dart';
import 'package:flutter_application_2/core/helpers/extensions.dart';

class InteractionView extends StatelessWidget {
  final String Name1;
  final String Name2;
  final String interactions;
  const InteractionView(
      {super.key,
      required this.Name1,
      required this.Name2,
      required this.interactions});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          automaticallyImplyLeading: false,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          flexibleSpace:
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              width: 90,
              child: Padding(
                padding: const EdgeInsets.only(top: 40, right: 40),
                child: IconButton(
                  icon: ImageIcon(AssetImage('assets/backarrow.png')),
                  onPressed: () => context.pop(),
                ),
              ),
            ),
            Center(
              child: SizedBox(
                  width: 210,
                  height: 200,
                  child: Image.asset('assets/logos/logo.png')),
            )
          ]),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: 45,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: kBlueColor),
                  color: Color(0xffDCEAFD),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Center(
                child: Text(
                  '$Name1 + $Name2',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: kBlueColor),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 45,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: kBlueColor),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Center(
                child: Text(
                  'The Interaction',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              constraints: BoxConstraints(maxHeight: 600),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromRGBO(167, 206, 247, 0.647), width: 5),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  interactions,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

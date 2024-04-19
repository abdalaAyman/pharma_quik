// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 25),
        child: GridView.count(
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/logos/Rectangle 3370 (1).png'),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Text(
                        'Diabetes',
                        style: TextStyle(fontSize: 15),
                      ),
                    )
                  ]),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/logos/Rectangle 3370 (2).png'),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Text(
                        'Blood pressure spiked',
                        style: TextStyle(fontSize: 15),
                      ),
                    )
                  ]),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/logos/Rectangle 3370 (3).png'),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Text(
                        'Acne',
                        style: TextStyle(fontSize: 15),
                      ),
                    )
                  ]),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/logos/Rectangle 3370 (4).png'),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Text(
                        'Cholestrol sprain',
                        style: TextStyle(fontSize: 15),
                      ),
                    )
                  ]),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/logos/Rectangle 3370 (5).png'),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Text(
                        'Blood pressure spiked',
                        style: TextStyle(fontSize: 15),
                      ),
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}

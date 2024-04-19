// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pharmaquik/features/Home/presentation/view/category_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Image.asset('assets/logos/logo.png'),
            ),
            // Image(
            //   image: AssetImage('assets/logos/pngPic.png'),
            // ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                minLines: 1,
                maxLines: 2,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    size: 30,
                  ),
                  prefixIconColor: const Color.fromARGB(255, 18, 92, 153),
                  hintText: 'Search any medicine....',
                  hintStyle: TextStyle(fontSize: 18),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 130, bottom: 32),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                          border: Border.all(color: Colors.grey)),
                      height: 50,
                      alignment: Alignment.center,
                      child: Text(
                        'Categories of Diseases',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  CategoryCard(),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants.dart';
import 'category_list.dart';
import 'category_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: Container(
            child: AppBar(
              shadowColor: Colors.grey.withOpacity(0.3),
              automaticallyImplyLeading: false,
              surfaceTintColor: Colors.transparent,
              elevation: .1,
              flexibleSpace: Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Image.asset('assets/logos/logo.png'),
              ),
              centerTitle: true,
              backgroundColor: kPrimaryColor,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
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
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                        border: Border.all(
                          color: Color.fromARGB(122, 118, 214, 255),
                        )),
                    height: 50,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      'Categories of Diseases',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    children: [
                      CategoryCard(
                        categoryImageUrl: 'assets/Rectangle 3370 (1).png',
                        categoryName: 'Diabetes',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryListPage(
                                PageName: ' Diabetes',
                                categoryId: 1,
                              ),
                            ),
                          );
                        },
                      ),
                      CategoryCard(
                        categoryImageUrl: 'assets/Rectangle 3370 (2).png',
                        categoryName: 'Blood pressure spiked',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryListPage(
                                PageName: ' Blood pressure spiked',
                                categoryId: 2,
                              ),
                            ),
                          );
                        },
                      ),
                      CategoryCard(
                        categoryImageUrl: 'assets/Rectangle 3370 (3).png',
                        categoryName: 'Acne',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryListPage(
                                PageName: ' Acne',
                                categoryId: 4,
                              ),
                            ),
                          );
                        },
                      ),
                      CategoryCard(
                        categoryImageUrl: 'assets/Rectangle 3370 (4).png',
                        categoryName: 'Cholestrol sprain',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryListPage(
                                PageName: ' Cholestrol sprain',
                                categoryId: 4,
                              ),
                            ),
                          );
                        },
                      ),
                      CategoryCard(
                        categoryImageUrl: 'assets/Rectangle 3370 (5).png',
                        categoryName: 'Blood pressure spiked',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryListPage(
                                PageName: ' Blood pressure spiked',
                                categoryId: 5,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

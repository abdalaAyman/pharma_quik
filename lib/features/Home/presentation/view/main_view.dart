// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/helpers/extensions.dart';
import 'package:flutter_application_2/features/Home/presentation/view/home_view.dart';
import 'package:flutter_application_2/features/Home/presentation/view/search_view.dart';
import '../../../../constants.dart';
import '../../../../core/routing/routes.dart';
import 'alarm_veiw.dart';
import 'save_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  // int _currentIndex = 0;

  int pageIndex = 0;

  final pages = [
    const HomeView(),
    const Search(),
    SaveView(),
    const AlarmView(),
  ];

  final List<Widget> _widget = <Widget>[
    HomeView(),
    Search(),
    SaveView(),
    AlarmView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          // backgroundColor: Colors.blue,
          backgroundColor: Colors.transparent,
          elevation: 0,
          focusColor: Colors.transparent,
          onPressed: () {
            context.pushNamed(Routes.SecondMedicine);
          },
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Color.fromARGB(122, 118, 214, 255),
              ),
              CircleAvatar(
                radius: 25,
                backgroundColor: kPrimaryColor,
              ),
              CircleAvatar(
                  radius: 23,
                  backgroundColor: Color.fromARGB(122, 118, 214, 255),
                  child: ImageIcon(
                    AssetImage('assets/grayintr.png'),
                    size: 40,
                    color: kGrayColor,
                  )),
            ],
          )),
      bottomNavigationBar: SizedBox(
        height: 58,
        child: BottomAppBar(
          color: Color.fromARGB(122, 118, 214, 255),
          shape: CircularNotchedRectangle(),
          notchMargin: 6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 0;
                    });
                  },
                  icon: pageIndex == 0
                      ? Icon(
                          Icons.home_filled,
                          color: kBlueColor,
                        )
                      : Icon(
                          Icons.home_filled,
                          color: kGrayColor,
                        )),
              IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 1;
                    });
                  },
                  icon: pageIndex == 1
                      ? Icon(
                          Icons.search_sharp,
                          color: kBlueColor,
                        )
                      : Icon(
                          Icons.search_sharp,
                          color: kGrayColor,
                        )),
              SizedBox(
                width: 5,
              ),
              IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 2;
                    });
                  },
                  icon: pageIndex == 2
                      ? Icon(
                          Icons.favorite_outlined,
                          color: kBlueColor,
                        )
                      : Icon(
                          Icons.favorite_outline,
                          color: kGrayColor,
                        )),
              IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 3;
                    });
                  },
                  icon: pageIndex == 3
                      ? Icon(
                          Icons.access_alarm,
                          color: kBlueColor,
                        )
                      : Icon(
                          Icons.access_alarm,
                          color: kGrayColor,
                        )),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: ImageIcon(AssetImage('assets/homeIcon.png')),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //         icon: ImageIcon(AssetImage('assets/search.png')),
      //         label: 'Search'),
      //     BottomNavigationBarItem(
      //       icon: ImageIcon(AssetImage('assets/save.png')),
      //       label: 'Save',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.access_alarm_rounded),
      //       label: 'Alarm',
      //     ),
      //   ],
      //   currentIndex: _currentIndex,
      //   unselectedItemColor: kGrayColor,
      //   selectedItemColor: kBlueColor,
      //   onTap: _changeItem,
      // ),
    );
  }

  void _changeItem(int value) {
    // print(value);
    setState(() {
      pageIndex = value;
    });
  }
}

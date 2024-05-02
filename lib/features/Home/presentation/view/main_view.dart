import 'package:flutter/material.dart';
import 'package:pharmaquik/features/Home/presentation/view/add_view.dart';
import 'package:pharmaquik/features/Home/presentation/view/home_view.dart';
import 'package:pharmaquik/features/Home/presentation/view/search_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;

  final List<Widget> _widget = <Widget>[
    const HomeView(),
    const Search(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widget.elementAt(_currentIndex),
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          // backgroundColor: Colors.blue,
          // backgroundColor: Colors.transparent,
          elevation: 0,
          focusColor: Colors.transparent,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddButtonScreen(),
                ));
          },
          child: const Stack(
            alignment: AlignmentDirectional.center,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              )
            ],
          )
          // CircleAvatar(
          //   backgroundColor: Colors.blue,
          //   // backgroundColor: Colors.white,
          //   // backgroundColor: Colors.red,
          //   child: Icon(Icons.add),
          // )
          //const Icon(Icons.add),

          ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        ],
        currentIndex: _currentIndex,
        unselectedItemColor: Colors.grey,
        onTap: _changeItem,
      ),
    );
  }

  void _changeItem(int value) {
    // print(value);
    setState(() {
      _currentIndex = value;
    });
  }
}

import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Image.asset('assets/logos/logo.png'),
        TextField(
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
      ]),
    );
  }
}

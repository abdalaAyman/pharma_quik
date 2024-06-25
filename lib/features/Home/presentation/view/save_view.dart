import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/helpers/extensions.dart';
import 'package:flutter_application_2/features/provider_controller/provider_controller.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import '../../../../constants.dart';

class SaveView extends StatelessWidget {
  SaveView({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: SizedBox(
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
      body: favoriteProvider.favorites.length == 0
          ? Center(
              child: Text("No Saved Items Found."),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: favoriteProvider.favorites.length,
                itemBuilder: (context, index) {
                  final item = favoriteProvider.favorites[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                      child: ListTile(
                        contentPadding: EdgeInsets.all(16),
                        leading: CircleAvatar(
                          child: Icon(Icons.favorite, color: Colors.white),
                          backgroundColor: Colors.blue,
                        ),
                        title: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            favoriteProvider.removeFavorite(index);
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}

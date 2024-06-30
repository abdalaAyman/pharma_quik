import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/helpers/extensions.dart';
import 'package:flutter_application_2/features/Home/presentation/manager/get_medicin_services.dart';
import 'package:flutter_application_2/features/Home/presentation/view/widgets/one_medicine_details.dart';
import 'package:flutter_application_2/features/provider_controller/provider_controller.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import '../../../../constants.dart';
import '../../model/informations.dart';

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
      body: favoriteProvider.favorites.isEmpty
          ? const Center(
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
                    child: InkWell(
                      onTap: () async {
                        try {
                          MedicineModel med =
                              await MedicineDataApiService.getOnlyMedicines(
                                  medicine: item);

                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => OneMedicineDetails(
                                  medicineName: item, medicines: med)));
                        } catch (e) {
                          print('$e');
                        }
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 5,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: const LinearGradient(
                                colors: [
                                  kBlueColor,
                                  Colors.blue,
                                  Colors.blue,
                                  kBlueColor
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              )),
                          child: ListTile(
                            selectedColor: Colors.transparent,
                            contentPadding: const EdgeInsets.all(16),
                            leading: const CircleAvatar(
                              backgroundColor: Colors.transparent,
                              child: Icon(Icons.favorite, color: Colors.white),
                            ),
                            title: Text(
                              item,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                favoriteProvider.removeFavorite(index);
                              },
                            ),
                          ),
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

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_application_2/core/helpers/extensions.dart';
import 'package:flutter_application_2/features/Home/model/informations.dart';
import 'package:flutter_application_2/features/Home/presentation/manager/get_medicin_services.dart';

class CategoryListPage extends StatelessWidget {
  final String PageName;

  const CategoryListPage({
    super.key,
    required this.PageName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          automaticallyImplyLeading: false,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          flexibleSpace:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SizedBox(
              width: 90,
              child: Padding(
                padding: const EdgeInsets.only(top: 40, right: 40),
                child: IconButton(
                  icon: const ImageIcon(AssetImage('assets/backarrow.png')),
                  onPressed: () => context.pop(),
                ),
              ),
            ),
            SizedBox(width: 210, child: Image.asset('assets/logos/logo.png')),
            Container(
              width: 90,
            )
          ]),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 140),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: const Offset(2, 2),
                        )
                      ],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                      border: Border.all(
                        color: const Color.fromARGB(122, 118, 214, 255),
                      )),
                  height: 50,
                  width: 230,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    PageName,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              FutureBuilder<List<MedicineModel>>(
                  future: MedicineDataApiService.getAllMedicines(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<MedicineModel> categories = snapshot.data!;
                      List<MedicineModel> filterMedicines = [];

                      if (categories.isNotEmpty) {
                        return ListView.builder(
                          itemCount: filterMedicines.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Text('${filterMedicines[index].category}');
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Text('Get Medicines Error');
                      } else {
                        return Center(
                            child: Text(
                          'No Medicines Yet',
                          style: TextStyle(color: Colors.black),
                        ));
                      }
                    } else {
                      return Center(
                          child: CircularProgressIndicator(
                        backgroundColor: Colors.blueAccent,
                        color: Colors.black,
                      ));
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
////////http://pharmaquick1.runasp.net/api/Categories/1
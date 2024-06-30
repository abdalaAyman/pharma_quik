// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_application_2/core/helpers/extensions.dart';
import 'package:flutter_application_2/features/Home/model/informations.dart';
import 'package:flutter_application_2/features/Home/presentation/manager/get_medicin_services.dart';
import 'package:flutter_application_2/features/Home/presentation/view/widgets/one_medicine_details.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/**
 * @description category view (medicines of category)
 */
class CategoryListPage extends StatelessWidget {
  final String PageName;
  final int categoryId;

  const CategoryListPage(
      {super.key, required this.PageName, required this.categoryId});

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
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
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
            alignment: Alignment.center,
            child: Text(
              PageName,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          FutureBuilder<List<MedicineModel>>(
              future: MedicineDataApiService.getMedicinesByCategory(
                  categoryId != 5
                      ? (categoryId <= 2 ? categoryId : categoryId - 2)
                      : 1),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<MedicineModel> filterMedicines = snapshot.data ?? [];

                  switch (categoryId) {
                    case 3:
                      filterMedicines = filterMedicines.reversed.toList();
                      break;
                    case 4:
                      filterMedicines = filterMedicines.reversed.toList();
                      break;
                    case 5:
                      filterMedicines = filterMedicines.sublist(15, 95);
                      break;
                  }

                  if (filterMedicines.isNotEmpty) {
                    return Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height - 210,
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        constraints: BoxConstraints(
                          maxWidth:
                              double.infinity, // Optional: Set maximum width
                        ),
                        // decoration: BoxDecoration(
                        //   border: Border.all(color: Colors.blueAccent),
                        // ),
                        child: ListView.builder(
                          itemCount: filterMedicines.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: const Offset(1, 1),
                                      )
                                    ],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    border: Border.all(
                                      color: Color.fromARGB(122, 118, 214, 255),
                                    ),
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  child: Material(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    color: Colors.white,
                                    child: InkWell(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                      onTap: () async {
                                        try {
                                          MedicineModel med =
                                              await MedicineDataApiService
                                                  .getOnlyMedicines(
                                                      medicine: filterMedicines[
                                                                  index]
                                                              .medicationName ??
                                                          '');

                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      OneMedicineDetails(
                                                          medicineName:
                                                              filterMedicines[
                                                                          index]
                                                                      .medicationName ??
                                                                  '',
                                                          medicines: med)));
                                        } catch (e) {
                                          print('$e');
                                        }
                                      },
                                      hoverColor: Colors.black12,
                                      splashFactory: InkSplash.splashFactory,
                                      splashColor:
                                          Color.fromARGB(255, 22, 106, 175),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10,
                                            top: 12,
                                            bottom: 12,
                                            right: 10),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                  child: Container(
                                                padding:
                                                    EdgeInsets.only(right: 13),
                                                child: Text(
                                                  filterMedicines[index]
                                                          .medicationName ??
                                                      '',
                                                  overflow: TextOverflow.fade,
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      fontFamily: 'Roboto',
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              )),
                                              Icon(
                                                Icons
                                                    .keyboard_arrow_right_sharp,
                                                size: 25,
                                                color: Colors.black,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                            );
                          },
                        ),
                      ),
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
    );
  }
}

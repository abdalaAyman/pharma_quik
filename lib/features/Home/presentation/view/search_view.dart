// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants.dart';
import 'package:flutter_application_2/features/Home/model/informations.dart';
import 'package:flutter_application_2/features/Home/presentation/manager/get_medicin_services.dart';
import 'package:flutter_application_2/features/Home/presentation/view/widgets/one_medicine_details.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var medicineTitle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   create: (context) => ActivityCubit()..fetchMedications(),
    //   child: BlocBuilder<ActivityCubit, ActivityState>(
    //     builder: (context, state) {
    //       if (state == ActivityState.loading) {
    //         return const Center(child: CircularProgressIndicator());
    //       } else if (state == ActivityState.success) {
    //         return PreviewView();
    //       } else if (state == ActivityState.error) {
    //         return const Center(child: Text('Error fetching medications'));
    //       } else {
    //         return Container(); // Handle other states if necessary
    //       }
    //     },
    //   ),
    // );
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
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.search,
                cursorColor: kBlueColor,
                onSubmitted: (medicineName) async {
                  try {
                    MedicineModel med =
                        await MedicineDataApiService.getOnlyMedicines(
                            medicine: medicineName);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OneMedicineDetails(
                          medicineName: medicineName,
                          medicines: med,
                        ),
                      ),
                    );
                  } catch (e) {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text('Faild'),
                              content: SizedBox(
                                height: 20,
                                child: Center(
                                  child: Text('$e'),
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: Text('Close'),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Close the dialog
                                  },
                                ),
                              ],
                            ));
                  }
                },
                minLines: 1,
                maxLines: 2,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    size: 30,
                  ),
                  prefixIconColor: kBlueColor,
                  hintText: 'Search any medicine....',
                  hintStyle: TextStyle(fontSize: 18, color: kHentGrayColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kBlueColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(13)),
                    borderSide: BorderSide(color: kBlueColor, width: 2),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Recently Search',
                    style: TextStyle(fontSize: 20, fontFamily: 'Roboto'),
                  ),
                  Text(
                    'Clear',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 15,
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 110,
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 4.5,
                  //  childAspectRatio: 8 / 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,

                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Center(
                        child: Text(
                          'Metoprolol',
                          style: TextStyle(fontSize: 17, color: Colors.grey),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Center(
                        child: Text(
                          'Insulin Aspart',
                          style: TextStyle(fontSize: 17, color: Colors.grey),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Center(
                        child: Text(
                          'Corgard',
                          style: TextStyle(fontSize: 17, color: Colors.grey),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Center(
                        child: Text(
                          'Atenolo',
                          style: TextStyle(fontSize: 17, color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Search by Categories',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 100,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      width: 110,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.grey),
                      ),
                      margin: EdgeInsets.only(right: 6),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/Rectangle 3370 (6).png',
                              fit: BoxFit.fitHeight,
                              height: 50,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                'Diabetes',
                                style: TextStyle(fontSize: 11),
                              ),
                            )
                          ]),
                    ),
                    Container(
                      width: 110,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.grey),
                      ),
                      margin: EdgeInsets.only(right: 6),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/Rectangle 3370 (7).png',
                              fit: BoxFit.fitHeight,
                              height: 50,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                'Bool pressure spiked',
                                style: TextStyle(fontSize: 11),
                              ),
                            )
                          ]),
                    ),
                    Container(
                      width: 110,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.grey),
                      ),
                      margin: EdgeInsets.only(right: 6),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/Rectangle 3370 (8).png',
                              fit: BoxFit.fitHeight,
                              height: 50,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                'Ance',
                                style: TextStyle(fontSize: 11),
                              ),
                            )
                          ]),
                    ),
                    Container(
                      width: 110,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.grey),
                      ),
                      margin: EdgeInsets.only(right: 6),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/Rectangle 3370 (9).png',
                              fit: BoxFit.fitHeight,
                              height: 50,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                'Cholesterol sprain',
                                style: TextStyle(fontSize: 11),
                              ),
                            )
                          ]),
                    ),
                    Container(
                      width: 110,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.grey),
                      ),
                      margin: EdgeInsets.only(right: 6),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/Rectangle 3370 (10).png',
                              fit: BoxFit.fitHeight,
                              height: 50,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                'Blood pressure spiked',
                                style: TextStyle(fontSize: 11),
                              ),
                            )
                          ]),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

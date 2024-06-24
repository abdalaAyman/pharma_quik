// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/helpers/extensions.dart';
import 'package:flutter_application_2/core/widgets/custom_bottom.dart';
import 'package:flutter_application_2/features/Home/presentation/manager/get_medicin_services.dart';
import '../../../../constants.dart';
import 'interacion_view.dart';

class SecondMedicine extends StatefulWidget {
  const SecondMedicine({super.key});

  @override
  State<SecondMedicine> createState() => _SecondMedicineState();
}

class _SecondMedicineState extends State<SecondMedicine> {
  @override
  Widget build(BuildContext context) {
    String? medicineName1 = '';
    String? medicineName2 = '';
    String? interactions = '';

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
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  opacity: .15,
                  image: AssetImage('assets/grayintr.png'),
                  fit: BoxFit.fitWidth)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Interaction between medicines',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: kBlueColor),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: TextField(
                    onChanged: (value) => medicineName1 = value,
                    decoration: InputDecoration(
                      hintText: 'name of the first medicine..',
                      hintStyle:
                          const TextStyle(fontSize: 16, color: kHentGrayColor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: kGrayColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kBlueColor, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(13))),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: TextField(
                    onChanged: (value) => medicineName2 = value,
                    //  minLines: 1,
                    decoration: InputDecoration(
                      hintText: 'name of the second medicine..',
                      hintStyle:
                          const TextStyle(fontSize: 16, color: kHentGrayColor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: kGrayColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kBlueColor, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(13))),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomBottom(
                  buttonName: 'interaction',
                  onPressed: () async {
                    try {
                      interactions =
                          await MedicineDataApiService.getInteraction(
                              medicineName1 ?? '', medicineName2 ?? '');

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InteractionView(
                              Name1: medicineName1 ?? '',
                              Name2: medicineName2 ?? '',
                              interactions: interactions ?? '',
                            ),
                          ));
                    } catch (e) {
                      print(e.toString());
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

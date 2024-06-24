// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:flutter_application_2/constants.dart';
// import 'package:flutter_application_2/core/helpers/extensions.dart';
// import 'package:flutter_application_2/core/widgets/custom_listTile.dart';
// import 'package:flutter_application_2/features/Home/model/informations.dart';
// import 'package:flutter_application_2/features/Home/presentation/manager/get_medicin_services.dart';
// import 'package:flutter_application_2/features/Home/presentation/view/preview_view.dart';
// import '../../../../core/routing/routes.dart';
// import 'widgets/one_medicine_details.dart';

// class FindMedicine extends StatefulWidget {
//   FindMedicine({super.key});

//   @override
//   State<FindMedicine> createState() => _FindMedicineState();
// }

// class _FindMedicineState extends State<FindMedicine> {
//   String? medicineName = '';
//   var medicineTitle = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(100),
//         child: AppBar(
//           automaticallyImplyLeading: false,
//           surfaceTintColor: Colors.transparent,
//           elevation: 0,
//           flexibleSpace:
//               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//             SizedBox(
//               width: 90,
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 40, right: 40),
//                 child: IconButton(
//                   icon: ImageIcon(AssetImage('assets/backarrow.png')),
//                   onPressed: () => context.pop(),
//                 ),
//               ),
//             ),
//             SizedBox(width: 210, child: Image.asset('assets/logos/logo.png')),
//             Container(
//               width: 90,
//             )
//           ]),
//           centerTitle: true,
//           backgroundColor: Colors.transparent,
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               margin: EdgeInsets.only(right: 16, left: 16),
//               child: TextFormField(
//                 cursorColor: kBlueColor,
//                 onChanged: (txt) {
//                   medicineName = txt;
//                 },
//                 keyboardType: TextInputType.text,
//                 textInputAction: TextInputAction.done,
//                 controller: medicineTitle,
//                 decoration: InputDecoration(
//                   errorStyle: TextStyle(color: Colors.red),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15),
//                     borderSide: BorderSide(color: kGrayColor, width: 2),
//                   ),
//                   contentPadding: EdgeInsets.all(18),
//                   fillColor: Colors.white,
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15),
//                     borderSide: BorderSide(color: kGrayColor, width: 2),
//                   ),
//                   disabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15),
//                     borderSide: BorderSide(color: kGrayColor, width: 2),
//                   ),
//                   hintText: 'Enter The Name Of Medicine',
//                   filled: true,
//                   hintStyle: const TextStyle(
//                       color: Color.fromRGBO(59, 36, 36, 1),
//                       fontSize: 16,
//                       fontWeight: FontWeight.normal),
//                   focusColor: kGrayColor,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15),
//                     borderSide: BorderSide(color: kGrayColor, width: 2),
//                   ),
//                 ),
//                 style: Theme.of(context).textTheme.titleSmall!.copyWith(
//                       color: kBlueColor,
//                       fontSize: 16,
//                     ),
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 MedicineModel med =
//                     await MedicineDataApiService.getOnlyMedicines(
//                         medicine: medicineTitle.text);

//                 if (med.contraindicationsForUse!.isNotEmpty) {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => OneMedicineDetails(
//                         medicineName: medicineTitle.text,
//                         medicines: med,
//                       ),
//                     ),
//                   );
//                 } else {
//                   /// todo dialoge
//                 }
//               },
//               style: ButtonStyle(
//                   backgroundColor: MaterialStatePropertyAll(Colors.blue),
//                   side: MaterialStatePropertyAll(BorderSide.none),
//                   shape: MaterialStatePropertyAll(RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(1))),
//                   padding: MaterialStatePropertyAll(EdgeInsets.all(16)),
//                   visualDensity: VisualDensity.comfortable),
//               child: Text(
//                 'Search',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

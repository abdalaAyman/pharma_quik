// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants.dart';
import 'package:flutter_application_2/core/helpers/extensions.dart';
import 'package:flutter_application_2/core/widgets/custom_listTile.dart';
import 'package:flutter_application_2/features/Home/model/informations.dart';
import 'package:flutter_application_2/features/Home/presentation/view/preview_view.dart';
import 'package:flutter_application_2/features/provider_controller/provider_controller.dart';
import 'package:provider/provider.dart';

class OneMedicineDetails extends StatefulWidget {
  String medicineName;
  MedicineModel medicines;
  OneMedicineDetails({required this.medicineName, required this.medicines});
  bool isFav = false;

  @override
  State<OneMedicineDetails> createState() => _OneMedicineDetailsState();
}

class _OneMedicineDetailsState extends State<OneMedicineDetails> {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: Column(children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.medicineName,
                      style: TextStyle(
                          color: kBlueColor,
                          fontSize: 25,
                          fontWeight: FontWeight.w700),
                    ),
                    IconButton(
                        onPressed: () {
                          if (!favoriteProvider.favorites
                              .contains(widget.medicineName)) {
                            setState(() {
                              widget.isFav = true;
                            });
                            favoriteProvider.addFavorite(widget.medicineName);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    'This medicine has been stored before')));
                          }
                        },
                        icon: widget.isFav == true
                            ? Icon(
                                Icons.favorite,
                                size: 25,
                                color: Colors.blue,
                              )
                            : Icon(
                                Icons.favorite_border,
                                size: 25,
                                color: kBlueColor,
                              ))
                  ],
                ),
              ),
              CustomListTile(
                listtilename: 'Uses of the Medicine',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PreviewViewBody(
                        name: widget.medicineName,
                        pageName: 'Uses of the Medicine',
                        details: '${widget.medicines.useOfMedications}',
                      ),
                    ),
                  );
                },
              ),
              CustomListTile(
                listtilename: 'Precautions for use',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PreviewViewBody(
                        name: widget.medicineName,
                        pageName: 'Precautions for use',
                        details: '${widget.medicines.precautions}',
                      ),
                    ),
                  );
                },
              ),
              CustomListTile(
                listtilename: 'Contraindications for use',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PreviewViewBody(
                        name: widget.medicineName,
                        pageName: 'Contraindications for use',
                        details: '${widget.medicines.contraindicationsForUse}',
                      ),
                    ),
                  );
                },
              ),
              CustomListTile(
                listtilename: 'Side effects',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PreviewViewBody(
                        name: widget.medicineName,
                        pageName: 'Side effects',
                        details: '${widget.medicines.sideEffects}',
                      ),
                    ),
                  );
                },
              ),
              CustomListTile(
                listtilename: 'Medication alternation',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PreviewViewBody(
                        name: widget.medicineName,
                        pageName: 'Medication alternation',
                        details: '${widget.medicines.replacements}',
                      ),
                    ),
                  );
                },
              ),
              CustomListTile(
                listtilename: 'Active ingredients',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PreviewViewBody(
                        name: widget.medicineName,
                        pageName: 'Active ingredients',
                        details: '${widget.medicines.activeIngredients}',
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

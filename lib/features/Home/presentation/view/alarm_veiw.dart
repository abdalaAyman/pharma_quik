// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants.dart';
import 'package:flutter_application_2/features/Home/presentation/view/widgets/clock.dart';
import 'package:flutter_application_2/features/Home/presentation/view/widgets/clock_paint.dart';
import 'package:flutter_application_2/features/Home/presentation/view/widgets/one_medicine_details.dart';
import 'package:flutter_application_2/features/provider_controller/provider_controller.dart';
import 'package:provider/provider.dart';

import '../../model/informations.dart';
import '../manager/get_medicin_services.dart';

class AlarmView extends StatefulWidget {
  const AlarmView({super.key});

  @override
  State<AlarmView> createState() => _AlarmViewState();
}

class _AlarmViewState extends State<AlarmView> {
  List<Map<String, String>> cards = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController hourController = TextEditingController();
  TextEditingController minuteController = TextEditingController();
  String period = 'AM';

  String _formatTime(int hour, int minute, String period) {
    int formattedHour = hour % 12;
    formattedHour =
        formattedHour == 0 ? 12 : formattedHour; // Handle midnight and noon
    String formattedMinute = minute.toString().padLeft(2, '0');
    return '$formattedHour:$formattedMinute $period';
  }

  void _addCard(String name, String hour, String minute, String period) {
    int hourInt = int.parse(hour);
    int minuteInt = int.parse(minute);
    String formattedTime = _formatTime(hourInt, minuteInt, period);

    setState(() {
      cards.add({
        'name': name,
        'time': formattedTime,
      });
    });
  }

  void _deleteCard(int index) {
    setState(() {
      cards.removeAt(index);
    });
  }

  void _showInputDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Alarm'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: hourController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Hour'),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: minuteController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Minute'),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: DropdownButton<String>(
                      value: period,
                      onChanged: (String? newValue) {
                        setState(() {
                          period = newValue!;
                        });
                      },
                      items: <String>['AM', 'PM']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _addCard(nameController.text, hourController.text,
                      minuteController.text, period);
                  nameController.clear();
                  hourController.clear();
                  minuteController.clear();
                  period = 'AM';
                });
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          automaticallyImplyLeading: false,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Image.asset('assets/logos/logo.png'),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 180, width: 180, child: CLock()),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cards.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
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
                        title: Text(
                          '${cards[index]['name']}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w700),
                        ),
                        subtitle: Text(
                          'Time: ${cards[index]['time']}',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                        trailing: IconButton(
                            icon: const Icon(Icons.delete,
                                size: 30, color: Colors.red),
                            onPressed: () {
                              _deleteCard(index);
                            }),
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                        Colors.blue,
                      ),
                    ),
                    onPressed: _showInputDialog,
                    child: Text(
                      'Add Alarm',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pharmaquik/features/Home/presentation/view/add_sec_med_view.dart';

class AddButtonScreen extends StatelessWidget {
  const AddButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(),
              child: Image.asset('assets/logos/logo.png'),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'The Frist Medicine',
                  style: TextStyle(fontSize: 15, color: Color(0xff004AAD)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: SizedBox(
                    height: 50,
                    width: 218,
                    child: TextField(
                      //  minLines: 1,
                      decoration: InputDecoration(
                        hintText: 'Enter the name of the medicine..',
                        hintStyle: const TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14, right: 12),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey)),
                child: const ListTile(
                  trailing: Icon(
                    Icons.keyboard_arrow_right_sharp,
                    size: 30,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Uses of the Medicine',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14, right: 12),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey)),
                child: const ListTile(
                  trailing: Icon(
                    Icons.keyboard_arrow_right_sharp,
                    size: 30,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Precautions for use',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14, right: 12),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey)),
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Contraindications for use',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 105),
                      child: Icon(
                        Icons.keyboard_arrow_right_sharp,
                        size: 30,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14, right: 12),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey)),
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Side effects',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 210),
                      child: Icon(
                        Icons.keyboard_arrow_right_sharp,
                        size: 30,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14, right: 12),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey)),
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Medication alternatives',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 115),
                      child: Icon(
                        Icons.keyboard_arrow_right_sharp,
                        size: 30,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14, right: 12),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey)),
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Active ingredients',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 160),
                      child: Icon(
                        Icons.keyboard_arrow_right_sharp,
                        size: 30,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 150, bottom: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(140, 50),
                    backgroundColor: const Color.fromARGB(255, 7, 114, 201)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SecondMedicine(),
                      ));
                },
                child: const Text(
                  'Add another medication',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

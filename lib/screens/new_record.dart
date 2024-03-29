import 'package:flutter/material.dart';
import 'package:flutter_classes/models/meron_sqlite.dart';

class NewRecord extends StatefulWidget {
  const NewRecord({Key? key}) : super(key: key);

  @override
  _NewRecordState createState() => _NewRecordState();
}

class _NewRecordState extends State<NewRecord> {
  final txtIdnumber = TextEditingController();
  final txtFirstname = TextEditingController();
  final txtMiddlename = TextEditingController();
  final txtLastname = TextEditingController();

  @override
  void dispose() {
    txtIdnumber.dispose();
    txtFirstname.dispose();
    txtMiddlename.dispose();
    txtLastname.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("New Record"),
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: txtIdnumber,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "ID Number"),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: txtFirstname,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "First Name"),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: txtMiddlename,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Middle Name"),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: txtLastname,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Last Name"),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  MeronDatabase m = MeronDatabase(
                      id: txtIdnumber.text,
                      firstname: txtFirstname.text,
                      middlename: txtMiddlename.text,
                      lastname: txtLastname.text);
                  m.insertRecord(m);
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20.0),
                    minimumSize: const Size(150.0, 20.0),
                    textStyle: const TextStyle(fontSize: 20.0)),
                child: const Text("Save"),
              )
            ],
          ),
        )));
  }
}

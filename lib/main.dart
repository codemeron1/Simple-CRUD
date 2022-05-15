
import 'package:flutter_classes/screens/new_record.dart';
import 'package:flutter_classes/screens/records.dart';
import 'package:flutter_classes/screens/update_record.dart';
import 'package:flutter_classes/screens/view_record.dart';
import 'package:flutter/material.dart';
import 'models/meron_sqlite.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
    runApp(const Main());
}

class Main extends StatefulWidget {

  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  MeronDatabase m = MeronDatabase();
  late String id;
  late String firstname;
  late String middlename;
  late String lastname;

  void deleteRecord(String id)  {
    m.delete(id);
    setState(() {});
  }
  /// This only get the record to be put in the input fields. Not actually updating the record in the database.
  void editRecord(String id, String firstname, String middlename, String lastname) {
    this.id = id;
    this.firstname = firstname;
    this.middlename = middlename;
    this.lastname = lastname;
  }
  /// Updates specific record in the database.
  void updateRecord(MeronDatabase record, String oldId) {
    m.update(record, oldId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Simple CRUD",
      initialRoute: "/",
      routes: {
        "/" : (context) => Record(deleteRecord: deleteRecord, editRecord: editRecord),
        "/new_record" : (context) => const NewRecord(),
        "/update_record": (context) => UpdateRecord(id: id, firstname: firstname, middlename: middlename, lastname: lastname, updateRecord: updateRecord,),
      },
    );
  }
}

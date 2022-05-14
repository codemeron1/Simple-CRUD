
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
    debugPrint("the id $id");
    m.delete(id);
    setState(() {});
  }

  void editRecord(String id, String firstname, String middlename, String lastname) {
    this.id = id;
    this.firstname = firstname;
    this.middlename = middlename;
    this.lastname = lastname;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Simple CRUD",
      initialRoute: "/",
      routes: {
        "/" : (context) => Record(deleteRecord: deleteRecord, editRecord: editRecord,),
        "/new_record" : (context) => const NewRecord(),
        "/update_record": (context) => UpdateRecord(id: id, firstname: firstname, middlename: middlename, lastname: lastname),
      },
    );
  }
}

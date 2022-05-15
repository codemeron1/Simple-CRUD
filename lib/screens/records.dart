import 'package:flutter/material.dart';
import 'package:flutter_classes/screens/view_record.dart';

import 'new_record.dart';

class Record extends StatefulWidget {
  final Function deleteRecord;
  final Function editRecord;


  const Record({required this.deleteRecord, required this.editRecord, Key ? key}) : super(key: key);

  @override
  State<Record> createState() => _RecordState();
}

class _RecordState extends State<Record> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Records")),
      body: Column(
        children: [
          ViewRecord(deleteFunction: widget.deleteRecord, editRecord: widget.editRecord,),
        ],
      ),
      floatingActionButton: FloatingActionButton (
        onPressed: () {
          Navigator.pushNamed(context, "/new_record").then((_) => setState( () {}));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_classes/models/meron_sqlite.dart';
import 'package:flutter_classes/screens/new_record.dart';
import 'package:flutter_classes/widgets/record_cards.dart';

class ViewRecord extends StatefulWidget {
  final Function deleteFunction;
  final Function editRecord;

  const ViewRecord({required this.deleteFunction, required this.editRecord, Key? key}) : super(key: key);

  @override
  State<ViewRecord> createState() => _ViewRecordState();
}

class _ViewRecordState extends State<ViewRecord> {
  MeronDatabase m = MeronDatabase();
  @override
  Expanded build(BuildContext context) {
    return Expanded(
        child: FutureBuilder(
      future: m.records(),
      initialData: const [],
      builder: (BuildContext build, AsyncSnapshot<List> snapshot) {
        var data = snapshot.data; //the data that we need to display.
        var dataLength = data!.length;

        return dataLength == 0
            ? const Center (child: Text("No Record Yet."),)
            : ListView.builder(
                itemCount: dataLength,
                itemBuilder: (context, i) => RecordCard(
                    id: data[i].id,
                    firstName: data[i].firstname,
                    middleName: data[i].middlename,
                    lastName: data[i].lastname,
                    deleteRecord: widget.deleteFunction,
                    editRecord: widget.editRecord,
                ));
      },
    ));
  }
}

import 'package:flutter/material.dart';

class RecordCard extends StatefulWidget {
  //data that will be receive by the widget
  String id;
  String firstName;
  String middleName;
  String lastName;
  Function deleteRecord;
  Function editRecord;

  RecordCard(
      {
        required this.id,
        required this.firstName,
        required this.middleName,
        required this.lastName,
        required this.deleteRecord,
        required this.editRecord,
      Key? key})
      : super(key: key);

  @override
  State<RecordCard> createState() => _RecordCardState();
}

class _RecordCardState extends State<RecordCard> {

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(widget.firstName +
                    ' ' +
                    widget.middleName +
                    ' ' +
                    widget.lastName),
                Text(widget.id)
              ],
            ),
          ),
          IconButton(onPressed: () {
            widget.deleteRecord(widget.id);
          }, icon: const Icon(Icons.delete), color: Colors.red[500],),
          IconButton(onPressed: () {
            widget.editRecord(widget.id, widget.firstName, widget.middleName, widget.lastName);
            Navigator.pushNamed(context, "/update_record").then((_) => setState ( () {}));
          }, icon: const Icon(Icons.edit), color: Colors.blue[300] )
        ],
      ),
    );
  }
}

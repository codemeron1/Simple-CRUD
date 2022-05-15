import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecordCard extends StatefulWidget {
  //data that will be receive by the widget
  String id;
  String firstName;
  String middleName;
  String lastName;
  Function deleteRecord;
  Function editRecord;

  RecordCard(
      {required this.id,
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
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 5.0),
      child: Container(
        padding: const EdgeInsets.all(5.0),
        height: 80.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Image.asset("assets/images/user_500px.png",
                        height: 50.0, width: 50.0, fit: BoxFit.fill),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          widget.firstName.toUpperCase() +
                              ' ' +
                              widget.middleName.toUpperCase() +
                              ' ' +
                              widget.lastName.toUpperCase(),
                          style: GoogleFonts.openSans(
                            fontSize: 13.0,
                            fontWeight: FontWeight.w600,
                          )),
                      Text(widget.id,
                          style: GoogleFonts.openSans(
                            fontSize: 11.0,
                            fontWeight: FontWeight.w500,
                          ))

                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                widget.deleteRecord(widget.id);
              },
              icon: const Icon(Icons.delete),
              color: Colors.red[500],
            ),
            IconButton(
                onPressed: () {
                  widget.editRecord(widget.id, widget.firstName,
                      widget.middleName, widget.lastName);
                  Navigator.pushNamed(context, "/update_record")
                      .then((_) => setState(() {}));
                },
                icon: const Icon(Icons.edit),
                color: Colors.blue[300])
          ],
        ),
      ),
    );
  }
}

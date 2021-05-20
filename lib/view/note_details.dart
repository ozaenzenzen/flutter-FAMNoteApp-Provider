import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_fam_noteapp/model/note_operations.dart';

class NoteDetails extends StatefulWidget {
  @override
  _NoteDetailsState createState() => _NoteDetailsState();
}

class _NoteDetailsState extends State<NoteDetails> {
  int idCounter = 0;
  String titleDetail = "";
  String descriptionDetail = "";

  NotesOperation notesOperation;

  // TextEditingController titleController = TextEditingController();
  // TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // var tc = notesOperation.titleController;
    // var dc = notesOperation.descController;

    // tc.text = titleDetail;
    // dc.text = descriptionDetail;
    // dynamic s = widget.notesOperation.getNotes[1];
    return Scaffold(
      backgroundColor: Colors.green[300],

      // App Bar
      appBar: new AppBar(
        leading: new IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            if (titleDetail != null || descriptionDetail != null) {
              Provider.of<NotesOperation>(
                context,
                listen: false,
              ).addNewNote(
                titleDetail,
                descriptionDetail,
              );
              Navigator.pop(context);
            } else {
              Provider.of<NotesOperation>(
                context,
                listen: false,
              ).addNewNote(
                titleDetail = "Kosong",
                descriptionDetail = "Kosong",
              );
              Navigator.pop(context);
            }
          },
        ),
        backgroundColor: Colors.green[900],
        elevation: 0,
        title: new Text(
          "FAM Note App with Provider",
          style: new TextStyle(
            fontFamily: "SF UI",
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),

      // Body
      body: Container(
        margin: new EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        child: new Column(
          children: [
            //Title Text Field
            new TextField(
              
              maxLines: null,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Enter Title",
                hintStyle: new TextStyle(
                  fontFamily: "SF Compact",
                  fontWeight: FontWeight.w700,
                ),
              ),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  titleDetail = value;
                } else {
                  value = "Title Not Inserted";
                  titleDetail = value;
                }
              },
            ),

            //Description Text Field
            new TextField(
              
              maxLines: null,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Enter Description",
                hintStyle: new TextStyle(
                  fontFamily: "SF Compact",
                  fontWeight: FontWeight.w500,
                ),
              ),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  descriptionDetail = value;
                } else {
                  value = "Description Not Inserted";
                  descriptionDetail = value;
                }
              },
            ),
          ],
        ),
      ),

      // Floating Action Button : Save
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            heroTag: "delete",
            backgroundColor: Colors.green[900],
            icon: new Icon(Icons.delete),
            label: new Text("Delete"),
            onPressed: () {},
          ),
          new SizedBox(
            width: 10,
          ),
          FloatingActionButton.extended(
            heroTag: "saave",
            backgroundColor: Colors.green[900],
            icon: new Icon(Icons.save),
            label: new Text("Save"),
            onPressed: () {
              if (titleDetail != null || descriptionDetail != null) {
                Provider.of<NotesOperation>(
                  context,
                  listen: false,
                ).addNewNote(
                  titleDetail,
                  descriptionDetail,
                );
                Navigator.pop(context);
              } else {
                Provider.of<NotesOperation>(
                  context,
                  listen: false,
                ).addNewNote(
                  titleDetail = "Kosong",
                  descriptionDetail = "Kosong",
                );
                Navigator.pop(context);
                // print(notesOperation.getNotes);
              }
            },
          ),
        ],
      ),
    );
  }
}
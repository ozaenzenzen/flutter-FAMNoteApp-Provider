import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_fam_noteapp/model/note_operations.dart';

import '../model/note_operations.dart';
import 'home.dart';

class NoteDetails extends StatefulWidget {
  var idCounter;
  var ndTitle = "";
  var ndDescription = "";

  NoteDetails({this.idCounter, this.ndTitle, this.ndDescription});

  @override
  _NoteDetailsState createState() => _NoteDetailsState();
}

class _NoteDetailsState extends State<NoteDetails> {
  // int idCounter = 0;

  NotesOperation notesOperation;

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var id = widget.idCounter;
    String titleDetail = widget.ndTitle;
    String descriptionDetail = widget.ndDescription;
    // var tc = notesOperation.titleController;
    // var dc = notesOperation.descController;
    setState(() {
      titleController.text = titleDetail;
      descController.text = descriptionDetail;
    });
    // tc.text = titleDetail;
    // dc.text = descriptionDetail;
    // dynamic s = widget.notesOperation.getNotes[1];
    // NotesOperation data;
    return Scaffold(
      backgroundColor: Colors.green[300],

      // App Bar
      appBar: new AppBar(
        leading: new IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // saveNote(widget.idCounter, titleDetail, descriptionDetail, context);
            Navigator.pop(context);
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
              controller: titleController,
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
              controller: descController,
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
            onPressed: () {
              setState(
                () {
                  notesOperation.getNotes.removeAt(id);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ),
                    (route) => false,
                  );

                  ////
                  // if (data.getNotes == null) {
                  //   // if (data.getNotes.contains(widget.idCounter) == false) {
                  //   Widget snackBar = SnackBar(
                  //     content: new Text(
                  //       "Data belum tersimpan",
                  //     ),
                  //   );
                  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  // } else {
                  //   Provider.of<NotesOperation>(
                  //     context,
                  //     listen: false,
                  //   ).deleteNote(widget.idCounter);
                  //   Navigator.pop(context);
                  // }
                },
              );
            },
          ),
          new SizedBox(
            width: 10,
          ),
          FloatingActionButton.extended(
            heroTag: "save",
            backgroundColor: Colors.green[900],
            icon: new Icon(Icons.save),
            label: new Text("Save"),
            onPressed: () {
              saveNote(id, titleDetail, descriptionDetail, context);
            },
          ),
        ],
      ),
    );
  }

  void saveNote(var id, String titleDetail, String descriptionDetail, BuildContext context) {
    if (titleDetail != null || descriptionDetail != null) {
      Provider.of<NotesOperation>(
        context,
        listen: false,
      ).addNewNote(
        id,
        titleDetail,
        descriptionDetail,
      );
      Navigator.pop(context);
    } else {
      Provider.of<NotesOperation>(
        context,
        listen: false,
      ).addNewNote(
        id,
        titleDetail = "Kosong",
        descriptionDetail = "Kosong",
      );
      Navigator.pop(context);
      // print(notesOperation.getNotes);
    }
  }
}

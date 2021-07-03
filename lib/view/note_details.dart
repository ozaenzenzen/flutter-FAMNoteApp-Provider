//WATERMARK FAUZAN AKMAL MAHDI FAUZAN AKMAL MAHDI FAUZAN AKMAL MAHDI 
//APP FROM FAUZAN AKMAL MAHDI FAUZAN AKMAL MAHDI FAUZAN AKMAL MAHDI 


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';

import 'package:flutter_fam_noteapp/model/note_operations.dart';

import '../model/note_operations.dart';

class NoteDetails extends StatefulWidget {
  final trigger;
  final idCounter;
  final ndTitle;
  final ndDescription;

  NoteDetails({this.trigger, this.idCounter, this.ndTitle, this.ndDescription});

  @override
  _NoteDetailsState createState() => _NoteDetailsState();
}

class _NoteDetailsState extends State<NoteDetails> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
   var titleDetail = "";
   var descriptionDetail = "";

  @override
  Widget build(BuildContext context) {
    var typeSave = widget.trigger;
    var id = widget.idCounter;
    titleDetail = widget.ndTitle;
    descriptionDetail = widget.ndDescription;

    setState(() {
      titleController.text = titleDetail;
      descController.text = descriptionDetail;
    });

    // NotesOperation notesOperation;
    return Scaffold(
      backgroundColor: Colors.green[300],

      // App Bar
      appBar: new AppBar(
        leading: new IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // saveNote(widget.idCounter, titleDetail, descriptionDetail, context);
            Get.back();
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
              if (typeSave != "save") {
                Provider.of<NotesOperation>(
                  context,
                  listen: false,
                ).deleteNote(id);
                // print("data deleted ${id}");
                Get.back();

                ScaffoldMessenger.of(context).showSnackBar(
                  new SnackBar(
                    content: new Text("Data Deleted"),
                  ),
                );
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Data is not saved yet!'),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: const <Widget>[
                            Text('You have to save the note first'),
                            Text('And then you can delete the note.'),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('Back'),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      ],
                    );
                  },
                );
              }
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
              try {
                saveNote(typeSave, id, titleDetail, descriptionDetail, context);
              } catch (e) {
                print(e);
              }
            },
          ),
        ],
      ),
    );
  }

  void saveNote(var type, var id, String titleDetail, String descriptionDetail,
      BuildContext context) {
    if (type == "update") {
      Provider.of<NotesOperation>(
        context,
        listen: false,
      ).updateNote(
        id,
        titleDetail,
        descriptionDetail,
      );
      Get.back();
    } else {
      if (titleDetail != null || descriptionDetail != null) {
        Provider.of<NotesOperation>(
          context,
          listen: false,
        ).addNewNote(
          id,
          titleDetail,
          descriptionDetail,
        );
        Get.back();
      } else {
        Provider.of<NotesOperation>(
          context,
          listen: false,
        ).addNewNote(
          id,
          titleDetail = "Kosong",
          descriptionDetail = "Kosong",
        );
        Get.back();
      }
    }
  }
}

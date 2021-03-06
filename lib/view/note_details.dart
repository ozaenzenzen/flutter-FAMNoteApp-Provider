//WATERMARK FAUZAN AKMAL MAHDI FAUZAN AKMAL MAHDI FAUZAN AKMAL MAHDI
//APP FROM FAUZAN AKMAL MAHDI FAUZAN AKMAL MAHDI FAUZAN AKMAL MAHDI

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';

import 'package:flutter_fam_noteapp/services/note_operations.dart';

import '../services/note_operations.dart';

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
  var typeSave;
  var id;

  @override
  void initState() {
    titleDetail = widget.ndTitle;
    descriptionDetail = widget.ndDescription;
    titleController.text = titleDetail;
    descController.text = descriptionDetail;

    typeSave = widget.trigger;
    id = widget.idCounter;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // NotesOperation notesOperation;
    return Scaffold(
      backgroundColor: Colors.green[300],

      // App Bar
      appBar: new AppBar(
        leading: new IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
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
                Get.defaultDialog(
                    radius: 10.0,
                    title: 'Data is not saved yet!',
                    titleStyle: TextStyle(
                      fontSize: 20,
                      fontFamily: "SF Compact",
                    ),
                    middleText:
                        'You have to save the note first and then you can delete the note.',
                    middleTextStyle: TextStyle(
                      fontSize: 15,
                      fontFamily: "SF Compact",
                    ),
                    textCancel: "Back",
                    buttonColor: Colors.white);

                // showDialog(
                //   context: context,
                //   builder: (BuildContext context) {
                //     return HomeAlertDialog();
                //   },
                // );
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
              if (typeSave == "update") {
                update(id, titleDetail, descriptionDetail, context);
              } else {
                add(id, titleDetail, descriptionDetail, context);
              }
            },
          ),
        ],
      ),
    );
  }

  void update(var id, String titleDetail, String descriptionDetail,
      BuildContext context) {
    Provider.of<NotesOperation>(
      context,
      listen: false,
    ).updateNote(
      id,
      titleDetail,
      descriptionDetail,
    );
    Get.back();
  }

  void add(var id, String titleDetail, String descriptionDetail,
      BuildContext context) {
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

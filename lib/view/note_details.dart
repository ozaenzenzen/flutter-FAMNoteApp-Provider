import 'package:flutter/material.dart';
import 'package:flutter_fam_noteapp/model/note_operations.dart';
import 'package:provider/provider.dart';

class NoteDetails extends StatefulWidget {
  @override
  _NoteDetailsState createState() => _NoteDetailsState();
}

class _NoteDetailsState extends State<NoteDetails> {
  String titleDetail;
  String descriptionDetail;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      appBar: new AppBar(
        leading: new IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Provider.of<NotesOperation>(
              context,
              listen: false,
            ).addNewNote(
              titleDetail,
              descriptionDetail,
            );
            Navigator.pop(context, true);
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
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.green[900],
        icon: new Icon(Icons.save),
        label: new Text("Save"),
        onPressed: () {
          Provider.of<NotesOperation>(
            context,
            listen: false,
          ).addNewNote(
            titleDetail,
            descriptionDetail,
          );
          Navigator.pop(context);
        },
      ),
    );
  }
}

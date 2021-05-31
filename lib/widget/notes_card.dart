import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fam_noteapp/model/note.dart';
import 'package:flutter_fam_noteapp/model/note_operations.dart';
import 'package:flutter_fam_noteapp/view/note_details.dart';
import 'package:provider/provider.dart';

class NotesCard extends StatelessWidget {
  final Note note;
  final id;

  NotesCard({this.note, this.id});

  @override
  Widget build(BuildContext context) {
    // NotesOperation notesOperation;
    return new Container(
      margin: new EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      height: MediaQuery.of(context).size.height * 0.18,
      width: MediaQuery.of(context).size.width,
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.circular(10),
        color: Colors.green[500],
      ),
      child: InkWell(
        onTap: () {
          Note dataNO = Provider.of<NotesOperation>(
            context,
            listen: false,
          ).editNote(id);

          //WATERMARK FAUZAN AKMAL MAHDI FAUZAN AKMAL MAHDI FAUZAN AKMAL MAHDI
          //APP FROM FAUZAN AKMAL MAHDI FAUZAN AKMAL MAHDI FAUZAN AKMAL MAHDI

          Navigator.of(context).push(
            CupertinoPageRoute(
              builder: (BuildContext context) {
                // print("Update ke-${id}");
                return NoteDetails(
                  trigger: "update",
                  idCounter: id,
                  ndTitle: dataNO.title,
                  ndDescription: dataNO.description,
                );
              },
            ),
          );
        },
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Title
            new Container(
              margin: new EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
              ),
              child: new Text(
                note.title,
                style: new TextStyle(
                  fontFamily: "SF Compact",
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            //Divider
            Divider(
              height: 20,
              indent: 10,
              endIndent: 10,
              thickness: 1,
              color: Colors.black12,
            ),

            //Description
            new Container(
              margin: new EdgeInsets.only(
                bottom: 10,
                left: 10,
                right: 10,
              ),
              child: new Text(
                note.description,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: new TextStyle(
                  color: Colors.black45,
                  fontFamily: "SF Compact",
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

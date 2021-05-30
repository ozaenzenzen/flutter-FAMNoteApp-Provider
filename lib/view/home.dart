//WATERMARK FAUZAN AKMAL MAHDI FAUZAN AKMAL MAHDI FAUZAN AKMAL MAHDI
//APP FROM FAUZAN AKMAL MAHDI FAUZAN AKMAL MAHDI FAUZAN AKMAL MAHDI

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fam_noteapp/model/note.dart';
import 'package:flutter_fam_noteapp/model/note_operations.dart';
import 'package:flutter_fam_noteapp/view/note_details.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var temp;

  @override
  Widget build(BuildContext context) {
    //WATERMARK FAUZAN AKMAL MAHDI FAUZAN AKMAL MAHDI FAUZAN AKMAL MAHDI
//APP FROM FAUZAN AKMAL MAHDI FAUZAN AKMAL MAHDI FAUZAN AKMAL MAHDI
    // var constWidth = MediaQuery.of(context).size.width;
    // var constHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.green[300],

      //Appbar
      appBar: new AppBar(
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

      //Body
      body: Consumer<NotesOperation>(
        builder: (context, NotesOperation data, child) {
          return SingleChildScrollView(
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              itemCount: data.getNotes.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                temp = index;
                // print(temp);
                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (dismissed) {
                    setState(() {
                      data.getNotes.removeAt(index);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      new SnackBar(
                        content: new Text("Data Deleted"),
                      ),
                    );
                  },
                  child: NotesCard(
                    note: data.getNotes[index],
                    id: index,
                  ),
                );
              },
            ),
          );
        },
      ),

      //Floating Action Button
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[900],
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            CupertinoPageRoute(
              builder: (BuildContext context) {
                return NoteDetails(trigger: "save");
              },
            ),
          );
        },
      ),
    );
  }
}

// NotesOperation notesOperation;

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
        // boxShadow: [
        //   new BoxShadow(
        //     offset: new Offset(5, 5),
        //     spreadRadius: 1,
        //     blurRadius: 5,
        //     color: Colors.black45,
        //   ),
        // ],
        color: Colors.green[500],
      ),
      child: InkWell(
        onTap: () {
          Note dataNO = Provider.of<NotesOperation>(
            context,
            listen: false,
          ).editNote(id);

          // showDialog(
          //WATERMARK FAUZAN AKMAL MAHDI FAUZAN AKMAL MAHDI FAUZAN AKMAL MAHDI
          //APP FROM FAUZAN AKMAL MAHDI FAUZAN AKMAL MAHDI FAUZAN AKMAL MAHDI
          //   context: context,
          //   builder: (BuildContext context) {
          //     return AlertDialog(
          //       title: const Text('AlertDialog Title'),
          //       content: SingleChildScrollView(
          //         child: ListBody(
          //           children: const <Widget>[
          //             Text('This is a demo alert dialog.'),
          //             Text('Would you like to approve of this message?'),
          //           ],
          //         ),
          //       ),
          //       actions: <Widget>[
          //         TextButton(
          //           child: const Text('Approve'),
          //           onPressed: () {
          //             Navigator.of(context).pop();
          //           },
          //         ),
          //       ],
          //     );
          //   },
          // );

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

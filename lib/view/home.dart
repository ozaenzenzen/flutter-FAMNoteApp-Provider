//WATERMARK FAUZAN AKMAL MAHDI FAUZAN AKMAL MAHDI FAUZAN AKMAL MAHDI
//APP FROM FAUZAN AKMAL MAHDI FAUZAN AKMAL MAHDI FAUZAN AKMAL MAHDI

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fam_noteapp/model/note_operations.dart';
import 'package:flutter_fam_noteapp/view/note_details.dart';
import 'package:flutter_fam_noteapp/widget/notes_card.dart';
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

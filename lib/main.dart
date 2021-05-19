import 'package:flutter/material.dart';
import 'package:flutter_fam_noteapp/model/note_operations.dart';
import 'package:flutter_fam_noteapp/view/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NotesOperation>(
      create: (context) {
        return NotesOperation();
      },
      child: MaterialApp(
        // home: new NoteDetails(),
        home: new Home(),
        debugShowCheckedModeBanner: false,
        title: "FAM - Note App with Provider",
        theme: new ThemeData(
          pageTransitionsTheme: PageTransitionsTheme(
            builders: {
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            },
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_fam_noteapp/model/note.dart';

class NotesOperation extends ChangeNotifier{
  List<Note> _notes = <Note>[];

  List<Note> get getNotes {
    return _notes;
  }

  NotesOperation(){
    addNewNote("First Note", "First Note Description");
  }

  void addNewNote(String title, String description) {
    Note note = Note(title: title, description: description);
    _notes.add(note);
    notifyListeners();
  }
}

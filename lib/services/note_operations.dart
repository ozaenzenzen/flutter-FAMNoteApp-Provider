//WATERMARK FAUZAN AKMAL MAHDI FAUZAN AKMAL MAHDI FAUZAN AKMAL MAHDI
//APP FROM FAUZAN AKMAL MAHDI FAUZAN AKMAL MAHDI FAUZAN AKMAL MAHDI

import 'package:flutter/cupertino.dart';
import 'package:flutter_fam_noteapp/model/note.dart';

class NotesOperation extends ChangeNotifier {
  List<Note> _notes = <Note>[];

  List<Note> get getNotes {
    // notifyListeners();
    return _notes;
  }

  set setNotes(dynamic notes) {
    _notes = notes;
  }

  NotesOperation() {
    addNewNote(0, "First Note", "First Note Description");
  }

  void addNewNote(dynamic id, [String title, String description]) {
    Note note = Note(id: id, title: title, description: description);
    _notes.add(note);
    notifyListeners();
  }

  dynamic editNote(int id) {
    return _notes.elementAt(id);
  }

  void updateNote(dynamic id, [String title, String description]) {
    Note note = Note(id: id, title: title, description: description);
    _notes[id] = note;
    notifyListeners();
  }

  void deleteNote(int id) {
    _notes.removeAt(id);
    notifyListeners();
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_fam_noteapp/model/note.dart';

class NotesOperation extends ChangeNotifier {
  List<Note> _notes = <Note>[];

  List<Note> get getNotes {
    return _notes;
  }

  set setNotes(dynamic notes) {
    _notes = notes;
  }

  TextEditingController titleController = TextEditingController();

  TextEditingController get gettc {
    return titleController;
  }

  TextEditingController descController = TextEditingController();

  TextEditingController get getdc {
    return descController;
  }
  
  NotesOperation() {
    addNewNote("First Note", "First Note Description");
  }

  void addNewNote(var id, [String title, String description]) {
    Note note = Note(id: id, title: title, description: description);
    _notes.add(note);
    notifyListeners();
  }

  dynamic editNote(int id, String title, String description) {
    // Note note = Note(title: title, description: description);
    return _notes[id];
  }

  void deleteNote(int id) {
    _notes.removeAt(id);
    notifyListeners();
  }
}

import 'dart:convert';

import 'package:eric_notes_app/model/notes_model.dart';
import 'package:eric_notes_app/screens/create_note.dart';
import 'package:eric_notes_app/screens/widget/note_card.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  List<Note> notes = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    loadNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(15),
          child: Text("Eric Notes App",
              style: TextStyle(fontSize: 30, color: Colors.blue)),
        ),
        toolbarHeight: 80,
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return NoteCard(
              note: notes[index],
              index: index,
              onUpdateNote: onUpdateNote,
              onDeleteNote: onDeleteNote);
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CreateNew(onCreateNew: onCreateNew)));
          },
          child: const Icon(Icons.add)),
    );
  }

  void onCreateNew(note) {
    notes.add(note);
    saveNotes();
    setState(() {});
  }

  void onDeleteNote(int index) {
    notes.removeAt(index);
    saveNotes();
    setState(() {});
  }

  void onUpdateNote(note, int index) {
    notes[index] = note;
    saveNotes();
    setState(() {});
  }

  Future<void> saveNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> notesJsonList =
        notes.map((note) => jsonEncode(note.toMap())).toList();
    await prefs.setStringList('notes', notesJsonList);
  }

  Future<void> loadNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? notejsonlist = prefs.getStringList('notes');
    if (notejsonlist != null) {
      setState(() {
        notes = notejsonlist
            .map((notejson) => Note.fromMap(jsonDecode(notejson)))
            .toList();
      });
    }
  }
}

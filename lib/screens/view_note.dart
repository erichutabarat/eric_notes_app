import 'package:eric_notes_app/model/notes_model.dart';
import 'package:eric_notes_app/screens/edit_note.dart';
import 'package:flutter/material.dart';

class ViewNote extends StatelessWidget {
  const ViewNote(
      {super.key,
      required this.note,
      required this.index,
      required this.onUpdateNote,
      required this.onDeleteNote});
  final Note note;
  final int index;
  final Function(Note, int) onUpdateNote;
  final Function(int) onDeleteNote;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(15),
          child: Text("View Notes",
              style: TextStyle(fontSize: 30, color: Colors.blue)),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Delete Notes"),
                        content: const Text("Are you sure delete this note?"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                onDeleteNote(index);
                                Navigator.of(context).pop();
                              },
                              child: const Text("Yes")),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("No"))
                        ],
                      );
                    });
              },
              icon: const Icon(Icons.delete))
        ],
        toolbarHeight: 80,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(note.title, style: const TextStyle(fontSize: 35)),
            const SizedBox(height: 15),
            Text(note.category, style: const TextStyle(fontSize: 25)),
            const SizedBox(height: 15),
            Text(note.content, style: const TextStyle(fontSize: 28))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EditNote(
                    note: note, index: index, onEditNote: onUpdateNote)));
          },
          child: const Icon(Icons.edit)),
    );
  }
}

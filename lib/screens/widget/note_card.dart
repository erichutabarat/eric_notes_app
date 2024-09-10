import 'package:eric_notes_app/model/notes_model.dart';
import 'package:eric_notes_app/screens/view_note.dart';
import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  const NoteCard(
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
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ViewNote(
                  note: note,
                  index: index,
                  onUpdateNote: onUpdateNote,
                  onDeleteNote: onDeleteNote,
                )));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(note.title, style: const TextStyle(fontSize: 30)),
              Text(note.category, style: const TextStyle(fontSize: 20)),
              Text(note.content,
                  style: const TextStyle(fontSize: 20),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis),
            ],
          ),
        ),
      ),
    );
  }
}

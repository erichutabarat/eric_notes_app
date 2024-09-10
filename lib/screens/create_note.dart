import 'package:eric_notes_app/model/notes_model.dart';
import 'package:flutter/material.dart';

class CreateNew extends StatefulWidget {
  const CreateNew({super.key, required this.onCreateNew});

  final Function(Note) onCreateNew;
  @override
  State<CreateNew> createState() => _CreateNewState();
}

class _CreateNewState extends State<CreateNew> {
  final titleController = TextEditingController();
  final categoryController = TextEditingController();
  final contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(15),
          child: Text("Create New Notes",
              style: TextStyle(fontSize: 30, color: Colors.blue)),
        ),
        toolbarHeight: 80,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextFormField(
                controller: titleController,
                style: const TextStyle(fontSize: 28),
                decoration: const InputDecoration(
                    hintText: "Title", border: InputBorder.none)),
            const SizedBox(height: 20),
            TextFormField(
                controller: categoryController,
                style: const TextStyle(fontSize: 23),
                decoration: const InputDecoration(
                    hintText: "Category", border: InputBorder.none)),
            const SizedBox(height: 20),
            TextFormField(
              controller: contentController,
              style: const TextStyle(fontSize: 22),
              decoration: const InputDecoration(
                  hintText: "Content", border: InputBorder.none),
              maxLines: null,
              keyboardType: TextInputType.multiline,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (titleController.text.isEmpty ||
                categoryController.text.isEmpty ||
                contentController.text.isEmpty) {
              return;
            }
            final note = Note(
                title: titleController.text,
                category: categoryController.text,
                content: contentController.text);
            widget.onCreateNew(note);
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.save)),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  /*

  CREATE - a note and save in supabase

  */

  final textController = TextEditingController();

  void addNewNote() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            content: TextField(controller: textController),
            actions: [
              // save button
              TextButton(
                onPressed: () {
                  saveNote();
                  Navigator.pop(context);
                },
                child: const Text('Save'),
              ),
            ],
          ),
    );
  }

  void saveNote() async {
    await Supabase.instance.client.from('notes').insert({
      'body': textController.text,
    });
  }

  /*
   
  READ - notes from supabase in app

  */
  final _notesStream = Supabase.instance.client
      .from('notes').stream(primaryKey: ['id']);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: addNewNote,
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: _notesStream,
        builder: (context, snapshot) {

          // loading
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }     

          // loaded
          final notes = snapshot.data!;

          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {

              // get individual note
              final note = notes[index];

              // get the column you want
               final noteText = note['body'];

              // return as UI
              return Text(noteText);
            },
          );
        },
      ),
    );
  }
}

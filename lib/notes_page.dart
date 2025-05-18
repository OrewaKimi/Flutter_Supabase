import 'package:flutter/material.dart';

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

  void addNote() {
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

  void saveNote() {
    
  }

  /*
   
  READ - notes from supabase in app

  */

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

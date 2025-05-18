import 'package:flutter/material.dart';
import 'notes_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
// supabase setup
WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
  url:"https://vnsrqnmloqrtcabchhze.supabase.co",
  anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZuc3Jxbm1sb3FydGNhYmNoaHplIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDc1Nzc5NDMsImV4cCI6MjA2MzE1Mzk0M30.toUyQIbK_zpHPu-YAElm1jgkHBM5xDZoS6HQo3N0uNc',
  );
  //

// run the app

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotesPage(),
      
    );
  }
}

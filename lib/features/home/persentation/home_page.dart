import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:perla/features/login/presentation/page/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/utils/shared_preferences_keys.dart';

class HomePage extends StatefulWidget {
  static const kHomePath = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Note> _notes = [];
  final TextEditingController _textController = TextEditingController();
  SharedPreferences? sharedPreferences;

  void loadNotes() async {
    final prefs = await SharedPreferences.getInstance();
    final notesString = prefs.getString('notes');

    if (notesString != null) {
      final notesData = jsonDecode(notesString) as List;
      _notes = notesData.map((n) => Note.fromJson(n)).toList();
    }
    _notes.sort((a, b) => b.date.compareTo(a.date));
    setState(() {});
  }

  void addNote(String text) {
    final date = DateTime.now();
    final note = Note(text: text, date: date);

    setState(() {
      _notes.add(note);
      _notes.sort((a, b) => b.date.compareTo(a.date));
    });

    saveNotes();
  }

  @override
  void initState() {
    loadNotes();
    super.initState();
  }

  void updateNote(Note updatedNote) {
    setState(() {
      final index = _notes.indexWhere((n) => n.date == updatedNote.date);
      _notes[index] = updatedNote;
    });

    saveNotes();
  }

  void deleteNote(BuildContext context, Note note) {
    setState(() {
      _notes.remove(note);
    });
    saveNotes();

    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Note deleted')));
  }

  void saveNotes() async {
    final notesJson = _notes.map((n) => n.toJson()).toList();

    final prefs = await SharedPreferences.getInstance();
    prefs.setString('notes', jsonEncode(notesJson));
  }
  Future<void> logout() async {

    final sharedPreferences = await SharedPreferences.getInstance();

    await sharedPreferences.remove(SharedPreferencesKeys.apiToken);

    setState(() {});

    context.pushReplacement(LoginPage.kLoginPath);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        // title: But,
      ),
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                leading: const Icon(Icons.login_outlined),
                title: const Text('Log out'),
                onTap: () async {
                 await logout();
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 20.w,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _textController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter note text',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Container(
                    height: 60.h,
                    width: 90.w,
                    color: const Color(0xff6C63FF),
                    child: ElevatedButton(
                      onPressed: () {
                        addNote(_textController.text);
                        _textController.clear();
                      },
                      child: const Text('Add'),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
              ],
            ),
            Container(
              color: const Color(0xffF3F4F6),
              height: 40.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Text(
                      'Text',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Text(
                    'Date',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: 50.w,
                  ),
                  // Text('Edits Column'),
                ],
              ),
            ),
            ..._notes
                .map(
                  (note) => NoteCard(
                    note: note,
                    onDelete: () {
                      deleteNote(context, note);
                    },
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}

class Note {
  DateTime date;
  String text;

  Note({required this.date, required this.text});

  Map<String, dynamic> toJson() {
    return {'date': date.toIso8601String(), 'text': text};
  }

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      date: DateTime.parse(json['date']),
      text: json['text'],
    );
  }
}

class NoteCard extends StatefulWidget {
  final Note note;
  final VoidCallback onDelete;

  NoteCard({required this.note, required this.onDelete});

  @override
  _NoteCardState createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  late TextEditingController _textController;
  bool editMode = false;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: widget.note.text);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.w,
                      // vertical: 15.h,
                    ),
                    // child: Text(
                    //   widget.note.text,
                    //   overflow: TextOverflow.ellipsis,
                    // ),
                    child: editMode == true
                        ? TextField(
                            controller: _textController,
                            enabled: editMode,
                            onChanged: (text) {
                              if (editMode) {
                                setState(() {
                                  widget.note.text = text;
                                });
                              }
                            },
                          )
                        : Padding(
                            padding: EdgeInsets.only(top: 40.h),
                            child: Text(
                              widget.note.text,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 40.h),
                    child: Text(DateFormat('d-M-y').format(widget.note.date)),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        editMode = !editMode;
                      });
                    },
                    icon: Icon(
                      editMode == false ? Icons.edit : Icons.save,
                      color: Colors.blue,
                    )),
                IconButton(
                  onPressed: () {
                    widget.onDelete();
                  },
                  icon: const Icon(
                    Icons.restore_from_trash,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

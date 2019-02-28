import 'package:flutter/material.dart';
import 'package:notes/entity/note.dart';
import 'package:notes/view/new_item_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Note> notes = List<Note>();

  @override
  void initState() {
    notes.add(Note(title: 'item A'));
    notes.add(Note(title: 'item B'));
    notes.add(Note(title: 'item C'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
        centerTitle: true,
      ),
      body: buildListBody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () => openItem(),
      ),
    );
  }

  Widget buildListBody() {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, pos) {
        return buildListItem(notes[pos]);
      },
    );
  }

  Widget buildListItem(Note note) {
    return Dismissible(
      key: Key(note.hashCode.toString()),
      onDismissed: (direction) => removeNote(note),
      direction: DismissDirection.startToEnd,
      background: Container(
        color: Colors.red[400],
        child: Icon(Icons.delete, color: Colors.white),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 12.0),
      ),
      child: ListTile(
        title: Text(note.title),
        trailing: Checkbox(value: note.isCompleted, onChanged: null),
        onTap: () => setState(() => note.changeCompleteness()),
      ),
    );
  }

  void openItem() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return ItemView();
    }));
  }

  void removeNote(Note note) {
    notes.remove(note);
  }
}

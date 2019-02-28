import 'package:flutter/material.dart';

class ItemView extends StatefulWidget {
  @override
  _ItemViewState createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: textFieldController,
              onEditingComplete: () => save(),
            ),
            FlatButton(
              onPressed: () => save(),
              child: Text(
                'Save',
                style: TextStyle(color: Theme.of(context).accentColor),
              ),
            )
          ],
        ),
      ),
    );
  }

  void save() {
    print(textFieldController.text);
  }
}

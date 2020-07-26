import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddEvent extends StatefulWidget {
  @override
  _AddEvent createState() => _AddEvent();
}

class _AddEvent extends State<AddEvent> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("resources/appBar/wpiLogo.png", fit: BoxFit.contain,
                  height: 32),
            ],
          ),
        ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: nameController,
                obscureText: false,
                textAlign: TextAlign.center,
                decoration: new InputDecoration(
                  labelText: "Name",
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: descriptionController,
                keyboardType: TextInputType.multiline,
                minLines: 5, //Normal textInputField will be displayed
                maxLines: 10,
                decoration: new InputDecoration(
                  labelText: "Description",
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ), // when user presses enter it will adapt to it
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
        {
          print(DateTime.now().toString()),
          Firestore.instance
              .collection('Events')
              .document(DateTime.now().toString())
              .setData({
            'name': nameController.text,
            'maxCapacity': 3,
            'description' : descriptionController.text,
          })
        },
        tooltip: "Save",
        backgroundColor: Color.fromRGBO(172, 43, 55, 1),
        child: const Icon(Icons.save),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddEvent extends StatefulWidget {
  @override
  _AddEvent createState() => _AddEvent();
}

class _AddEvent extends State<AddEvent> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();
  TextEditingController organizerController = new TextEditingController();
  TextEditingController contactController = new TextEditingController();
  TextEditingController locationController = new TextEditingController();
  TextEditingController zoomController = new TextEditingController();
  TextEditingController capacityController = new TextEditingController();
  TextEditingController imageController = new TextEditingController();

  DateTime selectedDate = DateTime.now();
  var dateFormater = new DateFormat('MM-dd');
  var timeFormater = new DateFormat('HH:mm');

  Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (pickedDate != null && pickedDate != selectedDate)
      setState(() {
        selectedDate = pickedDate;
      });
  }

  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child,
        );
      },
    );
    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Event Saved!'),
    );

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
      body: SingleChildScrollView(
        child: Container(
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
                    labelText: "Event Name",
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
                  minLines: 5,
                  //Normal textInputField will be displayed
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: organizerController,
                  obscureText: false,
                  textAlign: TextAlign.center,
                  decoration: new InputDecoration(
                    labelText: "Organizer",
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
                  controller: contactController,
                  obscureText: false,
                  textAlign: TextAlign.center,
                  decoration: new InputDecoration(
                    labelText: "Contact information",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                RaisedButton(
                  onPressed: () => _selectDate(context),
                  child: Text('Select date'),
                ),
                RaisedButton(
                  onPressed: () => _selectTime(context),
                  child: Text('Select time'),
                ),
              ]),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: locationController,
                  obscureText: false,
                  textAlign: TextAlign.center,
                  decoration: new InputDecoration(
                    labelText: "Location",
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
                  controller: zoomController,
                  obscureText: false,
                  textAlign: TextAlign.center,
                  decoration: new InputDecoration(
                    labelText: "Zoom link",
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
                  controller: capacityController,
                  obscureText: false,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                    labelText: "Max capacity",
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
                  controller: imageController,
                  obscureText: false,
                  textAlign: TextAlign.center,
                  decoration: new InputDecoration(
                    labelText: "Image URL",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Scaffold.of(context).showSnackBar(snackBar);
          Firestore.instance
              .collection('Events')
              .document(DateTime.now().toString())
              .setData({
            'name': nameController.text,
            'description': descriptionController.text,
            'organizer': organizerController.text,
            'contact': contactController.text,
            'date': dateFormater.format(selectedDate).toString(),
            'time': selectedTime.format(context).toString(),
            'location': locationController.text,
            'created': FieldValue.serverTimestamp(),
            'zoom': zoomController.text,
            'capacity': capacityController.text,
            'image': imageController.text
          });
        },
        tooltip: "Save",
        backgroundColor: Color.fromRGBO(172, 43, 55, 1),
        child: const Icon(Icons.save),
      ),
    );
  }
}

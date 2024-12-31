import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:module_5/database/dbhelper.dart';
import 'package:module_5/homescreen.dart';

class TaskForm extends StatefulWidget {
  @override
  _TaskFormState createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _formKey = GlobalKey<FormState>();
  TaskPage taskPage = TaskPage();

  String _taskPriority = 'Medium';
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  Dbhelper myDBhelper = Dbhelper.instance;
  TextEditingController TaskName = TextEditingController();
  TextEditingController TaskDiscription = TextEditingController();
  late String d, p, t;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        //shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [Colors.purple, Colors.pink], // Gradient colors for FAB
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Task Name Field
            TextFormField(
              controller: TaskName,
              decoration: InputDecoration(
                labelText: 'Task Name',
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            // Task Description Field
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Task Description',
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
              controller: TaskDiscription,
            ),
            SizedBox(height: 10),
            // Task Priority Dropdown
            DropdownButtonFormField<String>(
              value: _taskPriority,
              decoration: InputDecoration(
                labelText: 'Task Priority',
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
              icon: Icon(Icons.arrow_drop_down, color: Colors.white),
              items: ['High', 'Medium', 'Low'].map((String priority) {
                return DropdownMenuItem<String>(
                  value: priority,
                  child: Text(
                    priority,
                    style: TextStyle(color: Colors.black),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _taskPriority = value!;
                  t = _taskPriority;
                });
              },
            ),
            SizedBox(height: 10),
            // Task Date Picker
            TextFormField(
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Task Date',
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
                suffixIcon: Icon(
                  Icons.calendar_today,
                  color: Colors.white,
                ),
              ),
              onTap: () => _selectDate(context),
              validator: (value) {
                if (_selectedDate == null) {
                  return 'Please select a date';
                }
                return null;
              },
              controller: TextEditingController(
                text: _selectedDate != null
                    ? DateFormat('dd-MM-yyyy').format(_selectedDate!)
                    : '',
              ),
            ),
            SizedBox(height: 10),
            // Task Time Picker
            TextFormField(
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Task Time',
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
                suffixIcon: Icon(
                  Icons.access_time,
                  color: Colors.white,
                ),
              ),
              onTap: () => _selectTime(context),
              validator: (value) {
                if (_selectedTime == null) {
                  return 'Please select a time';
                }
                return null;
              },
              controller: TextEditingController(
                text:
                _selectedTime != null ? _selectedTime!.format(context) : '',
              ),
            ),
            SizedBox(height: 20),
            // Submit Button
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  insertTask();
                  taskPage.query();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => TaskPage()));
                  //  Navigator.pop(context); // Close the modal after submission
                  setState(() {
                    query();
                  });
                }
              },
              child: Text(
                'Add Task',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  // Date picker method
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.purple, // Header background color
            hintColor: Colors.pink, // Button colors
            colorScheme: ColorScheme.light(
              primary: Colors.purple, // Primary color for the date picker
              onPrimary: Colors.white, // Text color inside the header
              onSurface: Colors.black, // Color of the text in the body
            ),
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary, // Button text color
            ),
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  // Time picker method
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  Future<void> query() async {
    final allRows = await myDBhelper.queryAllTask();
    print('query all rows:');
    allRows.forEach(print);
    var allTask = allRows;
    setState(() {});
  }

  void insertTask() async {
    String taskName = TaskName.text;
    String taskDescription = TaskDiscription.text;
    String taskDate = _selectedDate != null
        ? DateFormat('yyyy-MM-dd').format(_selectedDate!)
        : 'No Date Selected';

    // Convert time to string
    String taskTime = _selectedTime != null
        ? _selectedTime!.format(context)
        : 'No Time Selected';

    // Priority is already a string
    String taskPriority = _taskPriority;
    Map<String, dynamic> row = {
      myDBhelper.columnName: taskName,
      myDBhelper.columnDescription: taskDescription,
      myDBhelper.columnTime: taskTime,
      myDBhelper.columnDate: taskDate,
      myDBhelper.columnPriority: taskPriority
    };
    final id = await myDBhelper.insertTask(row);

    print('inserted row id: $id');
    setState(() {
      query();
    });
  }
}
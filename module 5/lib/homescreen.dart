import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:module_5/database/dbhelper.dart';
import 'package:module_5/taskpage.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();

  Future<void> query() async {
    List<Map<String, dynamic>> allTask = [];
    Dbhelper myDBhelper = Dbhelper.instance;
    final allRows = await myDBhelper.queryAllTask();
    print('query all rows:');
    allRows.forEach(print);
    allTask = allRows;
  }
}

class _TaskPageState extends State<TaskPage> {
  Set<int> _selectedIndices = {};
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<Map<String, dynamic>> allTask = [];
  List<bool> isTapped = [];
  Dbhelper myDBhelper = Dbhelper.instance;
  TimeOfDay? _selectedTime;
  DateTime? _selectedDate;
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  String _taskPriority = 'Medium';
  TextEditingController TaskName = TextEditingController();
  TextEditingController TaskDiscription = TextEditingController();
  late String d, p, t;
  bool isGridView = false;
  // Function to show the date picker and update the TextFormField
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      // Format the selected date
      String formattedDate = DateFormat('dd-MM-yyyy').format(picked);

      // Set the formatted date to the TextFormField
      setState(() {
        _dateController.text = formattedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      // Convert the picked TimeOfDay to a formatted string
      final now = DateTime.now();
      final DateTime fullDateTime =
      DateTime(now.year, now.month, now.day, picked.hour, picked.minute);
      String formattedTime = DateFormat('HH:mm').format(fullDateTime);

      // Set the formatted time to the TextFormField
      setState(() {
        _timeController.text = formattedTime;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    query();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Task Management',
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue,Colors.white], // Gradient colors
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(isGridView ? Icons.list : Icons.grid_view),
            onPressed: () {
              setState(() {
                isGridView = !isGridView; // Toggle view state
              });
            },
          ),
        ],
      ),
      body: isGridView ? buildGridView() : buildListview(),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.pink], // Gradient colors for FAB
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: FloatingActionButton(
          onPressed: () {
            showinsertdialog(context);
            // _openTaskForm(context);
            setState(() {});
            // Add your onPressed action
          },
          backgroundColor: Colors.transparent, // Transparent so gradient shows
          child: Icon(Icons.edit),
        ),
      ),
    );
  }

  void _openTaskForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: TaskForm(),
      ),
    );
  }

  Future<void> query() async {
    final allRows = await myDBhelper.queryAllTask();
    print('query all rows:');
    allRows.forEach(print);
    allTask = allRows;
    setState(() {});
  }

  Future<void> _deleteItem(id) async {
    await myDBhelper.deleteTask(id);
    final allRows = await myDBhelper.queryAllTask();
    print('query all rows:');
    allRows.forEach(print);
    allTask = allRows;

    setState(() async {
      final allRows = await myDBhelper.queryAllTask();
      print('query all rows:');
      allRows.forEach(print);
      allTask = allRows;
      setState(() {});
    });
  }

  void _showEditDialog(Map<String, dynamic> item) {
    // Create controllers with existing values
    TextEditingController Name = TextEditingController(text: item['Task_Name']);
    TextEditingController description =
    TextEditingController(text: item['Task_Description']);

    showDialog(
      context: context,
      builder: (context) {
        var _taskPriority = item['Task_Priority'].toString();
        var time = item['Task_Time'].toString();
        var date = item['Task_date'].toString();
        //_selectedDate = item['Task_date'].toString();
        //var t = _selectedDate;
        return Dialog(
          backgroundColor:
          Colors.transparent, // Set to transparent to show the gradient
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: Text(
              "Edit Task",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent, // Dark blue color for title
              ),
            ),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildTextField(Name, 'Task Name', Icons.task),
                  SizedBox(height: 10),
                  _buildTextField(
                      description, 'Edit Task Description', Icons.note),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _dateController,
                    decoration: InputDecoration(
                      hintText: date,
                      suffixIcon: Icon(Icons.calendar_today),
                      border: OutlineInputBorder(),
                    ),
                    readOnly: true, // So the keyboard won't show
                    onTap: () {
                      // Show the date picker when the TextFormField is tapped
                      _selectDate(context);
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _timeController,
                    decoration: InputDecoration(
                      hintText: '$time',
                      suffixIcon: Icon(Icons.access_time),
                      border: OutlineInputBorder(),
                    ),
                    readOnly: true, // So the keyboard won't show
                    onTap: () {
                      // Show the time picker when the TextFormField is tapped
                      _selectTime(context);
                    },
                  ),
                  SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    value: _taskPriority = item['Task_Priority'].toString(),
                    decoration: InputDecoration(
                      labelText: 'Task Priority',
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(),
                    ),
                    icon: Icon(Icons.arrow_drop_down, color: Colors.black),
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
                        value = _taskPriority;
                      });
                    },
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  "Cancel",
                  style: TextStyle(
                      color: Colors.black), // Match with the theme color
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  String taskTime = _selectedTime != null
                      ? _selectedTime!.format(context)
                      : 'No Time Selected';
                  String taskDate = _selectedDate != null
                      ? DateFormat('yyyy-MM-dd').format(_selectedDate!)
                      : 'No Date Selected';
                  updateDonner(
                      id: item['Task_id'],
                      name: Name.text,
                      discreption: description.text,
                      time: _timeController.text,
                      priority: _taskPriority,
                      date: _dateController.text);
                },
                child: Text(
                  "Update",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent, // Button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String labelText, IconData icon,
      {TextInputType? keyboardType}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
        prefixIcon: Icon(icon, color: Colors.blue), // Icon color
      ),
      minLines: 1, // Set the minimum number of lines
      maxLines: null,
      keyboardType: keyboardType,
    );
  }

  void updateDonner({
    required int id,
    required String name,
    required String discreption,
    required String time,
    required String priority,
    required String date,
  }) async {
    // Update product in database
    await myDBhelper.updateTask({
      'Task_id': id,
      'Task_Name': name,
      'Task_Description': discreption,
      'Task_Time': time,
      'Task_date': date,
      'Task_Priority': priority
    });

    // Refresh the list after update
    query();
    Navigator.of(context).pop(); // Close the dialog box
  }

  void done({
    required int id,
  }) async {
    await myDBhelper.updateTaskStatus({'IsDone': 'true'} as int);
  }

  void showinsertdialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: Colors.purple,
            title: Text('insert Task', style: TextStyle(color: Colors.white)),
            content: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    TextFormField(
                      controller: TaskName,
                      decoration: InputDecoration(
                        labelText: 'Task Name',
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: TaskDiscription,
                      decoration: InputDecoration(
                        labelText: 'Task Description',
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
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
                      onTap: () => _selectDate1(context),
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
                      onTap: () => _selectTime1(context),
                      validator: (value) {
                        if (_selectedTime == null) {
                          return 'Please select a time';
                        }
                        return null;
                      },
                      controller: TextEditingController(
                        text: _selectedTime != null
                            ? _selectedTime!.format(context)
                            : '',
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              insertTask();
                              setState(() {
                                query();
                              });
                              Fluttertoast.showToast(
                                  msg: "Task Add",
                                  toastLength: Toast
                                      .LENGTH_SHORT, // Duration: LENGTH_SHORT or LENGTH_LONG
                                  gravity: ToastGravity
                                      .BOTTOM, // Position: BOTTOM, CENTER, TOP
                                  timeInSecForIosWeb:
                                  1, // Duration for iOS and Web
                                  backgroundColor: Colors
                                      .black, // Background color of the toast
                                  textColor:
                                  Colors.white, // Text color of the toast
                                  fontSize: 16.0 // Font size of the message
                              );
                              Navigator.of(context).pop();
                            }
                          },
                          child: Text(
                            'Add Task',
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Cancel',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  void _showAlertDialog(
      BuildContext context,
      int index,
      ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Alert"),
          content: Text("Complate the task."),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel')),
            SizedBox(
              width: 10,
            ),
            TextButton(
              child: Text("OK"),
              onPressed: () {
                setState(() {
                  // Toggle selection: Add or remove the index from the set
                  if (_selectedIndices.contains(index)) {
                    _selectedIndices.remove(index);
                  } else {
                    _selectedIndices.add(index);
                  }
                });
                Navigator.pop(context);
                //Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
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
    String done = 'false';
    // Priority is already a string
    String taskPriority = _taskPriority;
    Map<String, dynamic> row = {
      myDBhelper.columnName: taskName,
      myDBhelper.columnDescription: taskDescription,
      myDBhelper.columnTime: taskTime,
      myDBhelper.columnDate: taskDate,
      myDBhelper.columnPriority: taskPriority,
      myDBhelper.columnDone: done,
    };
    final id = await myDBhelper.insertTask(row);

    print('inserted row id: $id');
    setState(() {
      query();
    });
  }

  Future<void> _selectDate1(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
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
  Future<void> _selectTime1(BuildContext context) async {
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

  Widget buildListview() {
    return ListView.builder(
        itemCount: allTask.length,
        itemBuilder: (context, index) {
          final task = allTask[index];
          String color = allTask[index]['Task_Priority'];
          String clr = allTask[index]['IsDone'];
          bool value = clr.toLowerCase() == 'false';

          return Container(
            // Adds a shadow for better visual effect
            margin: EdgeInsets.symmetric(
                horizontal: 10, vertical: 6), // Adds space between cards
            decoration: BoxDecoration(
              border: Border.all(
                color: (allTask[index]['Task_Priority'] == 'High')
                    ? Colors.red // Red border for high priority
                    : (allTask[index]['Task_Priority'] == 'Medium')
                    ? Colors.yellow // Yellow border for medium priority
                    : Colors
                    .green, // Green border for low priority or default
                width: 4,
              ),
              borderRadius: BorderRadius.circular(10), // Rounded corners
            ),
            child: Padding(
              padding: const EdgeInsets.all(
                  10.0), // Adds padding inside the card for spacing
              child: ListTile(
                tileColor:
                _selectedIndices.contains(index) ? Colors.grey : null,
                contentPadding:
                EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                title: Text(
                  '${allTask[index]['Task_Name']}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    decoration: _selectedIndices.contains(index)
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    color: _selectedIndices.contains(index)
                        ? Colors.black
                        : Colors.black,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Text(
                      '${allTask[index]['Task_Description']}',
                      style: TextStyle(
                        fontSize: 14,
                        decoration: _selectedIndices.contains(index)
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        color: _selectedIndices.contains(index)
                            ? Colors.black
                            : Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.access_time,
                            color: Colors.purpleAccent, size: 18),
                        SizedBox(width: 5),
                        Text(
                          '${allTask[index]['Task_Time']}',
                          style: TextStyle(
                            fontSize: 14,
                            decoration: _selectedIndices.contains(index)
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            color: _selectedIndices.contains(index)
                                ? Colors.black
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.calendar_today,
                            color: Colors.pinkAccent, size: 18),
                        SizedBox(width: 5),
                        Text(
                          '${allTask[index]['Task_date']}', // Assuming this is the date
                          style: TextStyle(
                            fontSize: 14,
                            decoration: _selectedIndices.contains(index)
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            color: _selectedIndices.contains(index)
                                ? Colors.black
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize
                      .min, // Ensures the row takes only the necessary space
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.grey), // Edit icon
                      onPressed: () {
                        _showEditDialog(task);
                        print('Edit task: ${allTask[index]['Task_Name']}');
                        // You can navigate to an edit page or open a modal here
                      },
                    ),
                    IconButton(
                      icon:
                      Icon(Icons.delete, color: Colors.red), // Delete icon
                      onPressed: () {
                        _deleteItem(allTask[index]['Task_id']);

                        print('Delete task: ${allTask[index]['Task_Name']}');
                        // You can show a confirmation dialog or directly delete the task here
                      },
                    ),
                  ],
                ),
                onTap: () {
                  _showAlertDialog(context, index);
                  // _showContextMenu(context, index, value);
                },
              ),
            ),
          );
        });
  }

  void _showContextMenu(BuildContext context, int index, bool value) {
    bool val = value;
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.check),
                title: Text('Mark as Complete'),
                onTap: () {
                  //_toggleTileColor(index);
                  done(id: index);
                  Navigator.pop(context); // Close the bottom sheet
                },
              ),
              ListTile(
                leading: Icon(Icons.delete),
                title: Text('Delete Task'),
                onTap: () {
                  Navigator.pop(context); // Close the bottom sheet
                  setState(() {
                    allTask.removeAt(index); // Remove the task
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildGridView() {
    return GridView.builder(
      itemCount: allTask.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns in the grid
        crossAxisSpacing: 10, // Spacing between columns
        mainAxisSpacing: 10, // Spacing between rows
        childAspectRatio:
        0.8, // Adjust based on your design (width / height ratio)
      ),
      itemBuilder: (context, index) {
        final task = allTask[index];
        String color = allTask[index]['Task_Priority'];

        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            border: Border.all(
              color: (allTask[index]['Task_Priority'] == 'High')
                  ? Colors.red
                  : (allTask[index]['Task_Priority'] == 'Medium')
                  ? Colors.yellow
                  : Colors.green,
              width: 4,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${allTask[index]['Task_Name']}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 5),
                Expanded(
                  child: Text(
                    '${allTask[index]['Task_Description']}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                    maxLines: 3, // Limit description to avoid overflow
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.access_time,
                        color: Colors.purpleAccent, size: 18),
                    SizedBox(width: 5),
                    Text(
                      '${allTask[index]['Task_Time']}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.calendar_today,
                        color: Colors.pinkAccent, size: 18),
                    SizedBox(width: 5),
                    Text(
                      '${allTask[index]['Task_date']}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
                Spacer(), // Push the buttons to the bottom
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.grey),
                      onPressed: () {
                        _showEditDialog(task);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        _deleteItem(allTask[index]['Task_id']);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
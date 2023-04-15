import 'package:add_thing_todo/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTaskPage extends StatefulWidget {
  static const path = '/add_task';
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController _dateEditingController = TextEditingController();
  final TextEditingController _timeEditingController = TextEditingController();

  Future _datePickerDialog(BuildContext context) async {
    DateTime? date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1500),
        lastDate: DateTime(2100));
    if (date != null) {
      var formattedDate = DateFormat('MMM, d, y').format(date);
      _dateEditingController.text = formattedDate;
    }
  }

  Future _timePickerDialog(context) async {
    TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        initialEntryMode: TimePickerEntryMode.input);
    if (pickedTime != null) {
      final localizations = MaterialLocalizations.of(context);
      final formattedTimeOfDay = localizations.formatTimeOfDay(pickedTime);
      _timeEditingController.text = formattedTimeOfDay;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Task")),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        children: [
          _fields(),
        ],
      ),
    );
  }

  Widget _fields() {
    return Form(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title(title: 'Task'),
          const CustomTextField(
            maxLine: 1,
            hintText: 'add new task',
            // decoration: textFieldDecoration(),
          ),
          const SizedBox(height: 40),
          _title(title: 'Descriptions'),
          const CustomTextField(
            maxLine: 1,
            hintText: "descriptions",
            //  decoration: textFieldDecoration(),
          ),
          const SizedBox(height: 40),
          _dateAndTimePicker(),
        ],
      ),
    ));
  }

  Widget _dateAndTimePicker() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title(title: "Date"),
          CustomTextField(
            hintText: "Select date",
            controller: _dateEditingController,
            readOnly: true,
            // decoration: textFieldDecoration(),
            onTap: () async {
              await _datePickerDialog(context);
            },
          ),
          const SizedBox(height: 40),
          _title(title: "Time"),
          CustomTextField(
            hintText: "Select time",
            controller: _timeEditingController,
            readOnly: true,
            // decoration: textFieldDecoration(),
            onTap: () async {
              await _timePickerDialog(context);
            },
          )
        ],
      ),
    );
  }

  Widget _title({required title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
            fontWeight: FontWeight.w500, fontSize: 20, color: Colors.white),
      ),
    );
  }

  InputDecoration textFieldDecoration() {
    return const InputDecoration(
      // hintStyle: Theme.of(context)
      //     .inputDecorationTheme
      //     .hintStyle!
      //     .copyWith(color: Colors.white),
      hintStyle: TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
      // enabledBorder: UnderlineInputBorder(
      //   borderSide: BorderSide(color: Colors.white, width: 1),
      // ),
      // focusedBorder: UnderlineInputBorder(
      //   borderSide: BorderSide(color: Colors.white, width: 1),
      // ),
    );
  }
}

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_bs_ad_calendar/flutter_bs_ad_calendar.dart';

class NepaliCalendar extends StatefulWidget {
  const NepaliCalendar({super.key});

  @override
  State<NepaliCalendar> createState() => _NepaliCalendarState();
}

class _NepaliCalendarState extends State<NepaliCalendar> {
  //bool mondayweek = false;
  DateTime? _selectedDay;
  late final ValueNotifier<List<Event>> _selectedEvents;

  //store the event
  Map<DateTime, List<Event>> events = {};
  TextEditingController _eventcontroller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  DateTime? selectedDate;
   List<Event> _getEventsForDay(DateTime day) {
    return events[day]??[];
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text("Nepali Calendar")),
      ),
      body: FlutterBSADCalendar(
        // mondayWeek: false,
        weekendDays: [6],
        events: [],
       // events: _getEventsForDay(day), initialDate: null,, firstDate: null,;

        primaryColor: Colors.red,
        holidayColor: Colors.red,
        eventColor: Colors.blue,
        calendarType: CalendarType.bs,
        initialDate: DateTime.now(),
        firstDate: DateTime(2001, 1, 1),
        lastDate: DateTime(2030, 1, 9),
        onMonthChanged: (date, events) {
          setState(() {
            selectedDate = date;
          });
        },

        onDateSelected: (date, Events) {
          setState(() {
            selectedDate = date;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                scrollable: true,
                title: Text("Events Name"),
                content: Padding(
                  padding: EdgeInsets.all(8),
                  child: TextField(
                    controller: _eventcontroller,
                  ),
                ),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        events.addAll({
                          _selectedDay!: [Event(event: _eventcontroller.text)]
                        });
                        Navigator.of(context).pop();
                      },
                      child: Text("Submit"))
                ],
              );
            });
      }),
    );
  }

 
}

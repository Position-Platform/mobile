import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import 'package:position/src/core/utils/colors.dart';
import 'package:weekday_selector/weekday_selector.dart';

Widget step7() {
  final values = <bool?>[null, false, false, false, false, false, null];
  bool selectedSamedi = false;
  bool selectedDimanche = false;

  /* String weekDayTime;
  String samediDayTime;
  String dimancheDayTime;*/
  List<String> daySelect = [];

  // final f = DateFormat('HH:mm');
  return Container(
    margin: const EdgeInsets.only(left: 20.0, right: 20.0),
    child: Column(
      children: [
        SizedBox(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text("Jours de la semaine"),
              WeekdaySelector(
                displayedDays: const {
                  DateTime.sunday,
                  DateTime.monday,
                  DateTime.tuesday,
                  DateTime.wednesday,
                  DateTime.thursday,
                },
                shortWeekdays: const [
                  "Di",
                  "Lu",
                  "Ma",
                  "Me",
                  "Je",
                  "Ve",
                  "Sa",
                ],
                selectedFillColor: accentColor,
                onChanged: (v) {
                  printIntAsDay(v, daySelect);
                  /*  setState(() {
                    values[v % 7] = !values[v % 7]!;
                  });*/
                },
                selectedElevation: 15,
                elevation: 5,
                disabledElevation: 0,
                values: values,
              ),
              const SizedBox(
                height: 25,
              ),
              daySelect.isNotEmpty ? Container() : const SizedBox(),
              const SizedBox(
                height: 25,
              ),
              Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: CheckboxListTile(
                  title: const Text("Samedi",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  value: selectedSamedi,
                  onChanged: (bool? value) {
                    /*   setState(() {
                      selectedSamedi = value!;
                    });*/
                  },
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              selectedSamedi == true ? Container() : const SizedBox(),
              const SizedBox(
                height: 10,
              ),
              Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: CheckboxListTile(
                  title: const Text("Dimanche",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  value: selectedDimanche,
                  onChanged: (bool? value) {
                    /*  setState(() {
                      selectedDimanche = value!;
                    });*/
                  },
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              selectedDimanche == true ? Container() : const SizedBox(),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        )
      ],
    ),
  );
}

printIntAsDay(int day, List<String> daySelect) {
  if (daySelect.contains(intDayToFrench(day))) {
    daySelect.remove(intDayToFrench(day));
  } else {
    daySelect.add(intDayToFrench(day));
  }
}

String intDayToFrench(int day) {
  if (day % 7 == DateTime.monday % 7) return 'Lundi';
  if (day % 7 == DateTime.tuesday % 7) return 'Mardi';
  if (day % 7 == DateTime.wednesday % 7) return 'Mercredi';
  if (day % 7 == DateTime.thursday % 7) return 'Jeudi';
  if (day % 7 == DateTime.friday % 7) return 'Vendredi';
  throw '🐞 This should never have happened: $day';
}

class Days {
  String jour;
  bool selected;
  Days(this.jour, this.selected);
}

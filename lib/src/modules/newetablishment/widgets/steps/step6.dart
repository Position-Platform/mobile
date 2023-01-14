import 'package:flutter/material.dart';
import 'package:position/generated/l10n.dart';
import 'package:position/src/core/utils/colors.dart';
import 'package:position/src/modules/newetablishment/models/opentime.dart';
import 'package:position/src/modules/newetablishment/models/schedule.dart';
import 'package:position/src/modules/newetablishment/widgets/apppickeritem.dart';

Widget step6(BuildContext context) {
  const defaultStartTime = TimeOfDay(hour: 8, minute: 0);
  const defaultEndTime = TimeOfDay(hour: 18, minute: 0);
  List<OpenTimeModel> time = [
    OpenTimeModel(dayOfWeek: 1, key: 'Lundi', schedule: [
      ScheduleModel(
        start: defaultStartTime,
        end: defaultEndTime,
      ),
    ]),
    OpenTimeModel(dayOfWeek: 2, key: 'Mardi', schedule: [
      ScheduleModel(
        start: defaultStartTime,
        end: defaultEndTime,
      ),
    ]),
    OpenTimeModel(dayOfWeek: 3, key: 'Mercredi', schedule: [
      ScheduleModel(
        start: defaultStartTime,
        end: defaultEndTime,
      ),
    ]),
    OpenTimeModel(dayOfWeek: 4, key: 'Jeudi', schedule: [
      ScheduleModel(
        start: defaultStartTime,
        end: defaultEndTime,
      ),
    ]),
    OpenTimeModel(dayOfWeek: 5, key: 'Vendredi', schedule: [
      ScheduleModel(
        start: defaultStartTime,
        end: defaultEndTime,
      ),
    ]),
    OpenTimeModel(dayOfWeek: 6, key: 'Samedi', schedule: [
      ScheduleModel(
        start: defaultStartTime,
        end: defaultEndTime,
      ),
    ]),
    OpenTimeModel(dayOfWeek: 7, key: 'Dimanche', schedule: [
      ScheduleModel(
        start: defaultStartTime,
        end: defaultEndTime,
      ),
    ]),
  ];

  ///Show Time Time
  onTimePicker(TimeOfDay time, Function(TimeOfDay) callback) async {
    final picked = await showTimePicker(
      initialTime: time,
      context: context,
    );

    if (picked != null) {
      callback(picked);
    }
  }

  return Container(
    color: whiteColor,
    child: ListView.separated(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        final item = time[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.key,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final addAction = index == 0;
                final element = item.schedule[index];
                return Row(
                  children: [
                    Expanded(
                      child: AppPickerItem(
                        value: '${element.start.hour}:${element.start.minute}',
                        title: S.of(context).choose_hours,
                        onPressed: () {
                          onTimePicker(element.start, (time) {});
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: AppPickerItem(
                        value: "${element.end.hour}:${element.end.minute}",
                        title: S.of(context).choose_hours,
                        onPressed: () {
                          onTimePicker(element.end, (time) {});
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    InkWell(
                      onTap: () {
                        if (addAction) {
                          item.schedule.add(
                            ScheduleModel(
                              start: defaultStartTime,
                              end: defaultEndTime,
                            ),
                          );
                        } else {
                          item.schedule.remove(element);
                        }
                      },
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).primaryColor,
                        ),
                        child: Icon(
                          addAction ? Icons.add : Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 8);
              },
              itemCount: item.schedule.length,
            )
          ],
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 16);
      },
      itemCount: time.length,
    ),
  );
}

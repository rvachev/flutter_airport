import 'package:airport/common/styles/colors.dart';
import 'package:airport/common/widgets/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  final Function(DateTime) onDateChanged;

  const DatePicker({Key? key, required this.onDateChanged}) : super(key: key);

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: decrementDate,
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: mainColor,
                )),
            _DateEntry(
              date: currentDate,
              onDateTap: onDateTap,
            ),
            IconButton(
                onPressed: incrementDate,
                icon: const Icon(Icons.arrow_forward_ios, color: mainColor)),
          ],
        ),
        const CustomDivider(
          color: mainColor,
        )
      ],
    );
  }

  void onDateTap() {
    showDatePicker(
            context: context,
            initialDate: currentDate,
            firstDate: DateTime.now().subtract(const Duration(days: 3)),
            lastDate: DateTime.now().add(const Duration(days: 3)))
        .then((value) => setState(() {
              if (value != null) {
                currentDate = value;
                widget.onDateChanged(value);
              }
            }));
  }

  void incrementDate() {
    DateTime newDate = currentDate.add(const Duration(days: 1));
    if (newDate.isBefore(DateTime.now().add(const Duration(days: 3)))) {
      setState(() {
        currentDate = newDate;
        widget.onDateChanged(currentDate);
      });
    }
  }

  void decrementDate() {
    DateTime newDate = currentDate.subtract(const Duration(days: 1));
    if (newDate.isAfter(DateTime.now().subtract(const Duration(days: 4)))) {
      setState(() {
        currentDate = newDate;
        widget.onDateChanged(currentDate);
      });
    }
  }
}

class _DateEntry extends StatelessWidget {
  final DateTime date;
  final Function() onDateTap;

  const _DateEntry({Key? key, required this.date, required this.onDateTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onDateTap(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const Icon(
              Icons.calendar_today,
              color: Colors.grey,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              DateFormat('dd.MM.yyyy').format(date),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}

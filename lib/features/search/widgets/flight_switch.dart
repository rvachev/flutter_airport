import 'package:airport/common/styles/colors.dart';
import 'package:airport/common/widgets/custom_divider.dart';
import 'package:airport/features/schedule/models/schedule_type.dart';
import 'package:flutter/material.dart';

class FlightSwitch extends StatefulWidget {
  final Function(ScheduleType) onSelectedSwitchChanged;

  const FlightSwitch({Key? key, required this.onSelectedSwitchChanged})
      : super(key: key);

  @override
  State<FlightSwitch> createState() => _FlightSwitchState();
}

class _FlightSwitchState extends State<FlightSwitch> {
  final Map<ScheduleType, bool> _switchValues = {
    ScheduleType.arrive: true,
    ScheduleType.depart: false
  };

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _FlightSwitchItem(
          type: ScheduleType.arrive,
          isSelected: _switchValues[ScheduleType.arrive]!,
          onSwitchChanged: _onSwitch,
        ),
        _FlightSwitchItem(
          type: ScheduleType.depart,
          isSelected: _switchValues[ScheduleType.depart]!,
          onSwitchChanged: _onSwitch,
        )
      ],
    );
  }

  void _onSwitch(ScheduleType type) {
    if (!_switchValues[type]!) {
      setState(() {
        _switchValues.updateAll((key, value) => false);
        _switchValues[type] = true;
      });
      widget.onSelectedSwitchChanged(type);
    }
  }
}

class _FlightSwitchItem extends StatelessWidget {
  final ScheduleType type;
  final bool isSelected;
  final Function(ScheduleType) onSwitchChanged;

  const _FlightSwitchItem(
      {Key? key,
      required this.isSelected,
      required this.onSwitchChanged,
      required this.type})
      : super(key: key);

  Color get switchColor {
    return isSelected ? mainColor : Colors.grey;
  }

  String get switchName {
    switch (type) {
      case ScheduleType.arrive:
        return 'Прилет';
      case ScheduleType.depart:
        return 'Вылет';
    }
  }

  IconData get icon {
    switch (type) {
      case ScheduleType.arrive:
        return Icons.flight_land;
      case ScheduleType.depart:
        return Icons.flight_takeoff;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => onSwitchChanged(type),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(
                  icon,
                  color: switchColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  switchName,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: switchColor),
                )
              ]),
            ),
            CustomDivider(
              color: switchColor,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:airport/common/utils/date_utils.dart';
import 'package:airport/features/schedule/models/schedule_item.dart';
import 'package:airport/features/schedule/models/schedule_type.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;

final notificationsService =
    RM.inject(() => NotificationsService(), autoDisposeWhenNotUsed: false);

class NotificationsService {
  late final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationsService() {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Asia/Omsk'));
  }

  Future<void> init() async {
    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('icon');
    const IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings();
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (args) => print);
  }

  Future<void> scheduleFlightNotification(ScheduleItem scheduleItem) async {
    String title = 'Рейс ${scheduleItem.flight}';
    String body;
    DateTime scheduleDateTime =
        DateTime.parse(scheduleItem.date + 'T' + scheduleItem.scheduleTime);
    if (scheduleItem.type == ScheduleType.arrive) {
      body =
          'Ваш рейс скоро прибудет. Прибытие по расписанию - ${scheduleItem.date} ${scheduleItem.scheduleTime}';
    } else {
      body =
          'Скоро отправление! Вылет по расписанию - ${formatDateAndTime(scheduleDateTime)}';
    }
    await _flutterLocalNotificationsPlugin.zonedSchedule(
        scheduleItem.id,
        title,
        body,
        tz.TZDateTime.from(scheduleDateTime.subtract(const Duration(hours: 6)),
            tz.getLocation('Asia/Omsk')),
        const NotificationDetails(
            android: AndroidNotificationDetails(
                'flight_channel_id', 'flight_channel_name',
                channelDescription: 'channel for flight notifications')),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true);
  }

  Future<void> cancelScheduledFlightNotification(int id) async {
    _flutterLocalNotificationsPlugin.cancel(id);
  }
}

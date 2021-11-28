class ScheduleItem {
  late String date;
  late String airport;
  late String flight;
  late String company;
  late String scheduleArrive;
  String? waitingArrive;
  String? actualArrive;
  String? status;

  ScheduleItem(this.date, this.airport, this.flight, this.company,
      this.scheduleArrive, this.waitingArrive, this.actualArrive, this.status);

  factory ScheduleItem.fromJson(Map<String, dynamic> json) {
    return ScheduleItem(
        json['date'],
        json['airport'],
        json['flight'],
        json['company'],
        json['scheduleArrive'],
        json['waitingArrive'],
        json['actualArrive'],
        json['status']);
  }
}

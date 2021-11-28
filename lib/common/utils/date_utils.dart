String formatTime(int timeSubject) {
  if (timeSubject < 10) {
    return '0$timeSubject';
  } else {
    return timeSubject.toString();
  }
}

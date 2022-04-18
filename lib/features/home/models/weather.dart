class Weather {
  final int temp;
  final String description;
  final String imageUrl;

  Weather(
      {required this.temp, required this.description, required this.imageUrl});

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
        temp: map['current']['temp_c'].toInt(),
        description: map['current']['condition']['text'],
        imageUrl: 'https://' +
            map['current']['condition']['icon'].toString().substring(2));
  }
}

class Weather {
  final int temp;
  final String description;
  final String imageUrl;

  Weather(
      {required this.temp, required this.description, required this.imageUrl});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        temp: json['current']['temp_c'].toInt(),
        description: json['current']['condition']['text'],
        imageUrl: 'https://' +
            json['current']['condition']['icon'].toString().substring(2));
  }
}

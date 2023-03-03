class FeelsLike {
  final double day,night,eve,morn;

  FeelsLike({required this.day, required this.night, required this.eve, required this.morn});

  factory FeelsLike.fromJson(Map<String, dynamic> json) {
    return FeelsLike(
      day: json['day'].toDouble(),
      night: json['night'].toDouble(),
      eve: json['eve'],
      morn: json['morn'].toDouble(),
    );
  }
}

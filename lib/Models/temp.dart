class Temp {
  double day, min, max, night, eve, morn;
  Temp({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });

  factory Temp.fromJson(Map<String, dynamic> json) {
    return Temp(
      day: json['day'].toDouble(),
      min: json['min']. toDouble(),
      max: json['max'].toDouble(),
      night: json['night'].toDouble(),
      eve: json['eve'].toDouble(),
      morn: json['morn'].toDouble(),
    );
  }
}

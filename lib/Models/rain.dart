class Rain {
  double oneHour;

  Rain({
    required this.oneHour,
  });

  factory Rain.fromJson(Map<String, dynamic> json) {
    return Rain(
      oneHour: json['1h'].toDouble(),
    );
  }
}

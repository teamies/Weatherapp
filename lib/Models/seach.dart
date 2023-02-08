class Town {
  final String name, country, state;
  final Map<String, dynamic> localNames;
  final double lat, lon;

  Town({
    required this.name,
    required this.localNames,
    required this.lat,
    required this.lon,
    required this.country,
    required this.state,
  });
  
  factory Town.fromJson(Map<String, dynamic> json) {
    return Town(
      name: json['name'],
      localNames: Map<String, String>.from(json['local_names']),
      lat: json['lat'],
      lon: json['lon'],
      country: json['country'],
      state: json['state'],
    );
  }

  Map<String, dynamic> toJson() {
  return {
    'name': name,
    'local_names': localNames,
    'lat': lat,
    'lon': lon,
    'country': country,
    'state': state,
  };
}
}

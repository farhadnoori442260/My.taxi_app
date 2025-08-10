class Ride {
  final String id;
  final String passengerId;
  final String? driverId;
  final double fromLat;
  final double fromLng;
  final double toLat;
  final double toLng;
  final String status; // requested, accepted, on_trip, completed, cancelled

  Ride({
    required this.id,
    required this.passengerId,
    this.driverId,
    required this.fromLat,
    required this.fromLng,
    required this.toLat,
    required this.toLng,
    required this.status,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'passengerId': passengerId,
        'driverId': driverId,
        'fromLat': fromLat,
        'fromLng': fromLng,
        'toLat': toLat,
        'toLng': toLng,
        'status': status,
      };

  factory Ride.fromMap(Map<String, dynamic> m) => Ride(
        id: m['id'],
        passengerId: m['passengerId'],
        driverId: m['driverId'],
        fromLat: (m['fromLat'] as num).toDouble(),
        fromLng: (m['fromLng'] as num).toDouble(),
        toLat: (m['toLat'] as num).toDouble(),
        toLng: (m['toLng'] as num).toDouble(),
        status: m['status'],
      );
}

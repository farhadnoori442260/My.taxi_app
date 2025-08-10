import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/ride.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<Ride>> streamOpenRides() {
    return _db.collection('rides').where('status', isEqualTo: 'requested').snapshots().map(
        (snap) => snap.docs.map((d) => Ride.fromMap(d.data() as Map<String, dynamic>)).toList());
  }

  Future<void> createRide(Ride ride) async {
    await _db.collection('rides').doc(ride.id).set(ride.toMap());
  }

  Future<void> updateRideStatus(String id, String status, {String? driverId}) async {
    final data = {'status': status};
    if (driverId != null) data['driverId'] = driverId;
    await _db.collection('rides').doc(id).update(data);
  }
}

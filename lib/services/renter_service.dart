import 'package:cloud_firestore/cloud_firestore.dart';

class RenterService {

  Stream<QuerySnapshot> renters = FirebaseFirestore.instance.collection("Renters").snapshots();

}
import 'package:cloud_firestore/cloud_firestore.dart';

class ComplaintService {

  Stream<QuerySnapshot> renters = FirebaseFirestore.instance.collection("Renters").snapshots();

}
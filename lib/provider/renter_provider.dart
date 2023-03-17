import 'package:flutter/foundation.dart';

class RenterProvider with ChangeNotifier {
  late Map _renterDetails;

  getRenterDetails() => _renterDetails;

  void setRenterDetails(Map details) {
    _renterDetails = details;
  }
}

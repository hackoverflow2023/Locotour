import 'package:flutter/material.dart';

class ServiceItem {
  final String title;
  final double price;
  bool isSelected; // add isSelected property

  ServiceItem(
      {required this.title,
      required this.price,
      this.isSelected = false}); // default isSelected to false
}

class BookOrderScreen extends StatefulWidget {
  const BookOrderScreen({super.key});

  @override
  _BookOrderScreenState createState() => _BookOrderScreenState();
}

class _BookOrderScreenState extends State<BookOrderScreen> {

  final double _finalAmount = 0.0;

  final List<ServiceItem> _services = [
    ServiceItem(title: "Room Service", price: 10.0),
    ServiceItem(title: "Laundry Service", price: 5.0),
    ServiceItem(title: "Cleaning Service", price: 15.0),
  ];

  final List<ServiceItem> _selectedServices = [];


  void _toggleServiceSelection(int index) {
    setState(() {
      _services[index].isSelected =
          !_services[index].isSelected; // toggle isSelected value
      if (_services[index].isSelected) {
        _selectedServices
            .add(_services[index]); // add to selected services if selected
      } else {
        _selectedServices.remove(
            _services[index]); // remove from selected services if deselected
      }
    });
  }

  void _makePayment() {
    // Add your own logic for processing the payment here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Order"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Select Services",
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: _services.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _toggleServiceSelection(
                        index), // toggle service selection on tap
                    child: Card(
                      elevation: 2.0,
                      color: _services[index].isSelected
                          ? Colors.blue[100]
                          : null, // set background color if selected
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              _services[index].title,
                              style: const TextStyle(fontSize: 16.0),
                            ),
                            Text(
                              "\$${_services[index].price.toStringAsFixed(2)}",
                              style: const TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              "Selected Services:",
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _selectedServices.map((service) {
                return Text(
                  "${service.title} - \$${service.price.toStringAsFixed(2)}",
                  style: const TextStyle(fontSize: 16.0),
                );
              }).toList(),
            ),
            const SizedBox(height: 16.0),
            const Text(
              "Final amount:",
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8.0),
            Text(
              "\$$_finalAmount",
              style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _makePayment,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                textStyle: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text("Make Payment"),
            ),
          ],
        ),
      ),
    );
  }
}

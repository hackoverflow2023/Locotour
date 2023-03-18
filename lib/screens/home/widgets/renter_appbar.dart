import 'package:flutter/material.dart';
import 'package:locotour/provider/renter_provider.dart';
import 'package:provider/provider.dart';

class RenterAppBar extends StatelessWidget {
  final int index;
  const RenterAppBar({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final renterProvider = Provider.of<RenterProvider>(context);
    return SliverAppBar(
      automaticallyImplyLeading: false,
      floating: true,
      snap: true,
      expandedHeight: 200,
      flexibleSpace: SizedBox(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        renterProvider.getRenterDetails()[index]["Image"]),
                  )),
              child: Container(
                color: Colors.grey.withOpacity(.7),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      Text(
                        renterProvider.getRenterDetails()[index]['Name'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        renterProvider.getRenterDetails()[index]['Email'],
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        renterProvider.getRenterDetails()[index]['Address'],
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        renterProvider.getRenterDetails()[index]['Description'],
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: Icon(
                                Icons.map,
                                color: Theme.of(context).primaryColor,
                              ),
                              onPressed: () {
                                // mapLauncher();
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

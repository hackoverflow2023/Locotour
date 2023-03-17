import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RenterAppBar extends StatelessWidget {
  const RenterAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SliverAppBar(
      floating: true,
      snap: true,
      expandedHeight: 280,
      flexibleSpace: SizedBox(
        child: Padding(
          padding: const EdgeInsets.only(top: 86),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/event5.jpg"),
                    )),
                child: Container(
                  color: Colors.grey.withOpacity(.7),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        const Text(
                          "_store.storedetails['dialog']",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        const Text(
                          "_store.storedetails['address']",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          "_store.storedetails['email']",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          "Distance : {_store.distance}km",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.star,
                              color: Colors.white,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.white,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.white,
                            ),
                            Icon(
                              Icons.star_half,
                              color: Colors.white,
                            ),
                            Icon(
                              Icons.star_outline,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '(3.5)',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: IconButton(
                                icon: Icon(
                                  Icons.phone,
                                  color: Theme.of(context).primaryColor,
                                ),
                                onPressed: () {
                                  // launch(
                                  //     'tel:${_store.storedetails['mobile']}');
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
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
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.search),
        ),
      ],
      title: const Text(
        "_store.storedetails['shop_name']",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mobidthrift_seller_center/appbar/my_drawer.dart';

import '../appbar/My_appbar.dart';
import '../constants/App_colors.dart';
import '../constants/App_widgets.dart';
import 'Product_page.dart';

class ViewMorePage extends StatefulWidget {
  const ViewMorePage({Key? key}) : super(key: key);

  @override
  State<ViewMorePage> createState() => _ViewMorePageState();
}

class _ViewMorePageState extends State<ViewMorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar().myAppBar(context),
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.filter_list),
              color: AppColors.myIconColor,
            ),
            Center(child: AppWidgets().myHeading1Text('Phones')),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 250,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 10),
                children: [
                  Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11.0),
                    ),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ProductPage()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 112,
                                child: Image(
                                  // The Data will be loaded from firebse
                                  image: AssetImage("assets/images/phone.png"),
                                  // fit: BoxFit.cover,
                                ),
                              ),
                              AppWidgets().myHeading2Text('Product name'),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text('First line of discription'),
                              const Text('Rs.400 is current bid '),
                              const Text('1 Day time left '),
                              const SizedBox(
                                height: 22,
                              )
                            ],
                          ),
                        )),
                  ),
                  Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11.0),
                    ),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ProductPage()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 112,
                                child: Image(
                                  // The Data will be loaded from firebse
                                  image: AssetImage("assets/images/phone.png"),
                                  // fit: BoxFit.cover,
                                ),
                              ),
                              AppWidgets().myHeading2Text('Product name'),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text('First line of discription'),
                              const Text('Rs.400 is current bid '),
                              const Text('1 Day time left '),
                            ],
                          ),
                        )),
                  ),
                  Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11.0),
                    ),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ProductPage()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 112,
                                child: Image(
                                  // The Data will be loaded from firebse
                                  image: AssetImage("assets/images/phone.png"),
                                  // fit: BoxFit.cover,
                                ),
                              ),
                              AppWidgets().myHeading2Text('Product name'),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text('First line of discription'),
                              const Text('Rs.400 is current bid '),
                              const Text('1 Day time left '),
                            ],
                          ),
                        )),
                  ),
                  Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11.0),
                    ),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ProductPage()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 112,
                                child: Image(
                                  // The Data will be loaded from firebse
                                  image: AssetImage("assets/images/phone.png"),
                                  // fit: BoxFit.cover,
                                ),
                              ),
                              AppWidgets().myHeading2Text('Product name'),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text('First line of discription'),
                              const Text('Rs.400 is current bid '),
                              const Text('1 Day time left '),
                            ],
                          ),
                        )),
                  ),
                  Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11.0),
                    ),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ProductPage()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 112,
                                child: Image(
                                  // The Data will be loaded from firebse
                                  image: AssetImage("assets/images/phone.png"),
                                  // fit: BoxFit.cover,
                                ),
                              ),
                              AppWidgets().myHeading2Text('Product name'),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text('First line of discription'),
                              const Text('Rs.400 is current bid '),
                              const Text('1 Day time left '),
                              const SizedBox(
                                height: 22,
                              )
                            ],
                          ),
                        )),
                  ),
                  Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11.0),
                    ),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ProductPage()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 112,
                                child: Image(
                                  // The Data will be loaded from firebse
                                  image: AssetImage("assets/images/phone.png"),
                                  // fit: BoxFit.cover,
                                ),
                              ),
                              AppWidgets().myHeading2Text('Product name'),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text('First line of discription'),
                              const Text('Rs.400 is current bid '),
                              const Text('1 Day time left '),
                            ],
                          ),
                        )),
                  ),
                  Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11.0),
                    ),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ProductPage()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 112,
                                child: Image(
                                  // The Data will be loaded from firebse
                                  image: AssetImage("assets/images/phone.png"),
                                  // fit: BoxFit.cover,
                                ),
                              ),
                              AppWidgets().myHeading2Text('Product name'),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text('First line of discription'),
                              const Text('Rs.400 is current bid '),
                              const Text('1 Day time left '),
                            ],
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

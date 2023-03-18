import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/seller_products_provider.dart';

class OnlineOrders extends StatefulWidget {
  const OnlineOrders({Key? key}) : super(key: key);

  @override
  State<OnlineOrders> createState() => _OnlineOrdersState();
}

class _OnlineOrdersState extends State<OnlineOrders> {
  SellerProductProvider sellerProductProvider = SellerProductProvider();

  @override
  void initState() {
    SellerProductProvider sellerProductProvider =
        Provider.of(context, listen: false);
    sellerProductProvider.fitchCellPhonesProducts();
    sellerProductProvider.fitchPadsTabletsProducts();
    sellerProductProvider.fitchLaptopsProducts();
    sellerProductProvider.fitchSmartWatchesProducts();
    sellerProductProvider.fitchDesktopsProducts();
    sellerProductProvider.fitchAccessoriesProducts();
    sellerProductProvider.fitchPartsProducts();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    sellerProductProvider.getSearchProductsList.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    sellerProductProvider = Provider.of(context);
    // productProvider.fitchCellPhonesProducts();
    // productProvider.fitchPadsTabletsProducts();
    // productProvider.fitchLaptopsProducts();
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: ListView.builder(
      itemCount: sellerProductProvider.getSearchProductsList.length,
      itemBuilder: (BuildContext context, int index) {
        var data = sellerProductProvider.getSearchProductsList[index];
        return Padding(
          padding: const EdgeInsets.only(top: 33, right: 33, left: 33),
          child: Card(
            clipBehavior: Clip.antiAlias,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(11.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text('Remove'),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('Edit'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 142,
                    child: Image(
                      // The Data will be loaded from firebse
                      image: NetworkImage(data.productImage1!),
                      // fit: BoxFit.cover,
                    ),
                  ),
                  Text(data.productName!),
                  SizedBox(
                    height: 11,
                  ),
                  Text('Product discription'),
                  Text('Rs.1000 is current bid '),
                  Text('1 Day time left '),
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}

// Padding(
//   padding: const EdgeInsets.only(top: 33, right: 33, left: 33),
//   child: Card(
//     clipBehavior: Clip.antiAlias,
//     elevation: 4,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(11.0),
//     ),
//     child: Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         children: [
//           Row(
//
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextButton(onPressed: () {  }, child: Text('Remove'),),
//               SizedBox(
//
//                 height: 142,
//                 child: Image(
//                   // The Data will be loaded from firebse
//                   image: AssetImage("assets/images/phone.png"),
//                   // fit: BoxFit.cover,
//                 ),
//               ),
//               TextButton(onPressed: () {  }, child: Text('Edit'),),
//             ],
//           ),
//           Text('Iphone 14 Pro Max'),
//           SizedBox(height: 11,),
//           Text('Product discription'),
//           Text('Rs.1000 is current bid '),
//           Text('1 Day time left '),
//         ],
//       ),
//     ),
//   ),
// ),

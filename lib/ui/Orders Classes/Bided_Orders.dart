import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/bidding_product_provider.dart';

class BiddingOrders extends StatefulWidget {
  const BiddingOrders({Key? key}) : super(key: key);

  @override
  State<BiddingOrders> createState() => _BiddingOrdersState();
}

class _BiddingOrdersState extends State<BiddingOrders> {
  BiddingProductProvider biddingProductProvider = BiddingProductProvider();
  @override
  void initState() {
    BiddingProductProvider biddingProductProvider =
        Provider.of(context, listen: false);
    biddingProductProvider.fitchCellPhonesProducts();
    biddingProductProvider.fitchPadsTabletsProducts();
    biddingProductProvider.fitchLaptopsProducts();
    biddingProductProvider.fitchSmartWatchesProducts();
    biddingProductProvider.fitchDesktopsProducts();
    biddingProductProvider.fitchAccessoriesProducts();
    biddingProductProvider.fitchPartsProducts();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    biddingProductProvider.getSearchProductsList.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    biddingProductProvider = Provider.of(context);
    return Scaffold(
      body: ListView.builder(
        itemCount: biddingProductProvider.searchProductsList.length,
        itemBuilder: (BuildContext context, int index) {
          var data = biddingProductProvider.searchProductsList[index];
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
                        SizedBox(
                          width: 60,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('Accept'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 142,
                      child: Image(
                        // The Data will be loaded from firebse
                        image: NetworkImage(data.productImage1.toString()),
                        // fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      data.productName!,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    Text(data.productDescription!),
                    Text('Price: Rs.${data.productPrice!}'),
                    Text('1 Day time left '),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

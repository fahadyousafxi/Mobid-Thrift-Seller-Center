import 'package:flutter/material.dart';
import 'package:mobidthrift_seller_center/providers/sold_product_provider.dart';
import 'package:provider/provider.dart';

class SoldOrders extends StatefulWidget {
  const SoldOrders({Key? key}) : super(key: key);

  @override
  State<SoldOrders> createState() => _SoldOrdersState();
}

class _SoldOrdersState extends State<SoldOrders> {
  SoldProductProvider soldProductProvider = SoldProductProvider();

  @override
  void initState() {
    SoldProductProvider soldProductProvider =
        Provider.of(context, listen: false);
    soldProductProvider.getSoldProductData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    soldProductProvider = Provider.of(context);

    return Scaffold(
      body: ListView.builder(
        itemCount: soldProductProvider.getSoldProductDataList.length,
        itemBuilder: (BuildContext context, int index) {
          var data = soldProductProvider.getSoldProductDataList[index];
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
                          child: Text('Receipt'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 142,
                      child: Image(
                        // The Data will be loaded from firebase
                        image: NetworkImage(data.productImage1.toString()),
                        // fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      data.productName.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    Text(data.productDescription.toString()),
                    Text('Price: Rs.' + data.productPrice.toString()),
                    // Text('1 Day time left '),
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

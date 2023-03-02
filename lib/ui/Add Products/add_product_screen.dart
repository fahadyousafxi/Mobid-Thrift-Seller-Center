import 'package:flutter/material.dart';
import 'package:mobidthrift_seller_center/ui/Add%20Products/add_product.dart';

import '../../appbar/My_appbar.dart';
import '../../constants/App_colors.dart';
import '../../constants/App_widgets.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar().mySimpleAppBar(context, title: 'Select Product'),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppWidgets().myElevatedBTN(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddProduct(
                                  productCollectionName: 'CellPhonesProducts',
                                )));
                  },
                  btnText: 'Phones',
                  btnColor: AppColors.myRedColor),
              SizedBox(
                height: 22,
              ),


              AppWidgets().myElevatedBTN(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddProduct(
                                  productCollectionName: 'PadsAndTabletsProducts',
                                )));
                  },
                  btnText: 'Pads & Tablets',
                  btnColor: AppColors.myRedColor),
              SizedBox(
                height: 22,
              ),


              AppWidgets().myElevatedBTN(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddProduct(
                                  productCollectionName: 'SmartWatches',
                                )));
                  },
                  btnText: 'Smart Watches',
                  btnColor: AppColors.myRedColor),
              SizedBox(
                height: 22,
              ),


              AppWidgets().myElevatedBTN(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddProduct(
                                  productCollectionName: 'LaptopsProducts',
                                )));
                  },
                  btnText: 'Laptops',
                  btnColor: AppColors.myRedColor),
              SizedBox(
                height: 22,
              ),


              AppWidgets().myElevatedBTN(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddProduct(
                                  productCollectionName: 'Desktops',
                                )));
                  },
                  btnText: 'Desktops',
                  btnColor: AppColors.myRedColor),
              SizedBox(
                height: 22,
              ),


              AppWidgets().myElevatedBTN(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddProduct(
                                  productCollectionName: 'Accessories',
                                )));
                  },
                  btnText: 'Accessories',
                  btnColor: AppColors.myRedColor),
              SizedBox(
                height: 22,
              ),


              AppWidgets().myElevatedBTN(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddProduct(
                                  productCollectionName: 'Parts',
                                )));
                  },
                  btnText: 'Parts',
                  btnColor: AppColors.myRedColor),
              SizedBox(
                height: 22,
              ),



            ],
          ),
        ),
      ),
    );
  }
}

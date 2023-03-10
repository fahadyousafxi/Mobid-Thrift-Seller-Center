import 'package:flutter/material.dart';
import '../appbar/My_appbar.dart';
import '../constants/App_colors.dart';
import '../constants/App_widgets.dart';
import 'View_More_Page.dart';

class TradeInPage extends StatefulWidget {
  const TradeInPage({Key? key}) : super(key: key);

  @override
  State<TradeInPage> createState() => _TradeInPageState();
}

class _TradeInPageState extends State<TradeInPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: MyAppbar().myAppBar(context),
      drawer: MyAppbar().myDrawer(context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {print((size.height / 4).toString());},
                icon: Icon(Icons.filter_list),
                color: AppColors.myIconColor,
              ),

              // AppWidgets().myAddBannerContainer(height: size.height / 4.2),
              // SizedBox(height: 15,),

              AppWidgets().categoryRow(categoryText: 'Cell Phones', textButtonText: 'More Cell Phones', onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ViewMorePage()));}),
              SizedBox(height: 240, width: double.infinity, child: AppWidgets().myList(context)),

              SizedBox(height: 15,),
              AppWidgets().categoryRow(categoryText: 'Pads/Tablets', textButtonText: 'More Pads/Tablets', onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ViewMorePage()));}),
              SizedBox(height: 240, width: double.infinity, child: AppWidgets().myList(context)),

              SizedBox(height: 15,),
              AppWidgets().categoryRow(categoryText: 'Smart Watches', textButtonText: 'More Smart Watches', onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ViewMorePage()));}),
              SizedBox(height: size.height / 4, width: double.infinity, child: AppWidgets().myList(context)),

              SizedBox(height: 15,),
              AppWidgets().categoryRow(categoryText: 'Laptops', textButtonText: 'More Laptops', onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ViewMorePage()));}),
              SizedBox(height: size.height / 4, width: double.infinity, child: AppWidgets().myList(context)),

              SizedBox(height: 15,),
              AppWidgets().categoryRow(categoryText: 'Desktops', textButtonText: 'More Desktops', onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ViewMorePage()));}),
              SizedBox(height: size.height / 4, width: double.infinity, child: AppWidgets().myList(context)),

              SizedBox(height: 15,),
              AppWidgets().categoryRow(categoryText: 'Accessories', textButtonText: 'More Accessories', onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ViewMorePage()));}),
              SizedBox(height: size.height / 4, width: double.infinity, child: AppWidgets().myList(context)),

              SizedBox(height: 15,),
              AppWidgets().categoryRow(categoryText: 'Parts', textButtonText: 'More Parts', onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ViewMorePage()));}),
              SizedBox(height: size.height / 4, width: double.infinity, child: AppWidgets().myList(context)),

              SizedBox(height: 15,),


            ],
          ),
        ),
      ),
    );
  }
}


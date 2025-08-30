import 'package:commerce/asset_path.dart';
import 'package:commerce/screen/home/home_view_model.dart';
import 'package:commerce/screen/home/home_widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final HomeViewModel _viewModel = HomeViewModel();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 300,
            child: PageView(
              onPageChanged: (value) {
                currentIndex = value;
                setState(() {});
              },
              children: [
                ...List.generate(_viewModel.imageList.length, (index) {
                  return Image.asset(_viewModel.imageList[index], fit: BoxFit.cover);
                },)
              ],
            ),
          ),
          SizedBox(height: 24,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(_viewModel.imageList.length,(index){
              return AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: 10,
                width: currentIndex == index ? 20 : 10,
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: currentIndex == index ? Colors.grey : Colors.grey.shade300,
                ),
              );
            },),
          ),
          SizedBox(height: 24,),
          HomeWidgets.shortcut(iconList: [
            AssetPath.jacket,
            AssetPath.jumper,
            AssetPath.necklace,
            AssetPath.bag,
            AssetPath.cap,
            AssetPath.skirt,
            AssetPath.trousers,
            AssetPath.shirt,
          ]),
          SizedBox(height: 24,),
          HomeWidgets.subTitle('New things'),
          SizedBox(height: 10,),
          HomeWidgets.productHorizontal(_viewModel.newProductList),
          HomeWidgets.subTitle('Event'),
          SizedBox(height: 10,),
          SizedBox(height: 300, width: double.infinity,child: Image.asset(AssetPath.event, fit: BoxFit.cover,)),
          SizedBox(height: 50),
          HomeWidgets.subTitle('Today Discount'),
          SizedBox(height: 10,),
          HomeWidgets.productHorizontal(_viewModel.discountList),
        ],
      ),
    );
  }
}

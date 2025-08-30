import 'package:commerce/asset_path.dart';
import 'package:commerce/model/product_model.dart';
import 'package:flutter/cupertino.dart';

class HomeViewModel extends ChangeNotifier{
  static final HomeViewModel _homeViewModel = HomeViewModel._singleton();

  factory HomeViewModel() => _homeViewModel;

  HomeViewModel._singleton();
  void update() => notifyListeners();

  /// 배너 이미지 리스트
  final List<String> imageList = [
    AssetPath.cloth1,
    AssetPath.cloth2,
    AssetPath.cloth3,
    AssetPath.cloth4,
  ];

  /// 바로가기 아이콘 리스트
  final List<String> shortcutIcons = [
    AssetPath.jacket,
    AssetPath.jumper,
    AssetPath.necklace,
    AssetPath.bag,
    AssetPath.cap,
    AssetPath.skirt,
    AssetPath.trousers,
    AssetPath.shirt,
  ];

  /// 신상품 리스트
  final List<ProductModel> newProductList = [
    ProductModel(AssetPath.productJacketJean, 'Jacket Jean', 100000, 31, 4.3, false),
    ProductModel(AssetPath.productManJacket, 'Man Jacket', 200000, 31, 3.3, false),
    ProductModel(AssetPath.productWomen, 'Women Jacket', 350000, 31, 4.5, false),
    ProductModel(AssetPath.productManStreet, 'Man Jacket', 90000, 31, 3.0, false),
    ProductModel(AssetPath.productShoes, 'Shoes', 250000, 31, 4.3, false),
  ];

  /// 할인 상품 리스트
  final List<ProductModel> discountList = [
    ProductModel(AssetPath.productManSuit, 'Man Suit', 2500000, 20, 2.5, false),
    ProductModel(AssetPath.productWomen, 'Women Jacket', 300000, 31, 4.5, false),
  ];

  /// 인기 상품 (CartScreen 등에서 필요하다면)
  final List<ProductModel> popularProductList = [
    ProductModel(AssetPath.productShoes, 'Shoes', 250000, 31, 4.8, false),
    ProductModel(AssetPath.productManJacket, 'Man Jacket', 180000, 20, 4.2, false),
  ];
}
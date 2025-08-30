import 'package:commerce/screen/home/home_view_model.dart';
import 'package:commerce/screen/cart/cart_view_model.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartViewModel _cartViewModel = CartViewModel();
  final HomeViewModel _homeViewModel = HomeViewModel();

  @override
  void initState() {
    _cartViewModel.addListener(() {
      if (mounted) setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cartItems = _cartViewModel.getList();
    if (cartItems.isEmpty) {
      return const Center(
        child: Text(
          "장바구니에 담긴 제품이 없습니다.",
          style: TextStyle(fontSize: 20),
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        if (index < 0 || index >= cartItems.length) {
          return const SizedBox.shrink();
        }

        final productModel = cartItems[index];

        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          child: ListTile(
            leading: Image.asset(
              productModel.image,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(productModel.name),
            subtitle: Text("${productModel.price} 원"),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                setState(() {
                  _cartViewModel.remove(productModel);
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("장바구니 제거")),
                );

                for (var product in _homeViewModel.newProductList) {
                  if (product == productModel) {
                    product.cart = false;
                    _homeViewModel.update();
                    return;
                  }
                }
                for (var product in _homeViewModel.popularProductList) {
                  if (product == productModel) {
                    product.cart = false;
                    _homeViewModel.update();
                    return;
                  }
                }
              },
            ),
          ),
        );
      },
    );
  }
}
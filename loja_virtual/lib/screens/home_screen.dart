import 'package:flutter/material.dart';
import 'package:loja_virtual/tabs/category_tab.dart';
import 'package:loja_virtual/tabs/home_tab.dart';
import 'package:loja_virtual/tabs/orders_tab.dart';
import 'package:loja_virtual/tabs/places_tab.dart';
import 'package:loja_virtual/widgets/cart_buttom.dart';
import 'package:loja_virtual/widgets/custom_drawer.dart';


class HomeScreen extends StatelessWidget {
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
       Scaffold(
         body: HomeTab(),
         drawer: CustomDrawer(_pageController),
         floatingActionButton: CartButtom(),
       ),
        Scaffold(
          appBar: AppBar(title: Text("Produtos"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: CategorysTab(),
          floatingActionButton: CartButtom(),
        ),
        Scaffold(
          appBar: AppBar(title: Text('Lojas'), centerTitle: true,),
          body: PlacesTab(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(title: Text('Meus Pedidos'),centerTitle: true,),
          body: OrdersTab(),
          drawer: CustomDrawer(_pageController),
        )
      ],
    );
  }
}
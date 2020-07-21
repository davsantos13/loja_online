import 'package:flutter/material.dart';
import 'package:loja_virt/common/drawer/custom_drawer.dart';
import 'package:loja_virt/resources/page_manager.dart';
import 'package:loja_virt/screens/login/login_screen.dart';
import 'package:loja_virt/screens/products/products_screen.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatelessWidget {
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PageManager(pageController),
      child: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              centerTitle: true,
              elevation: 0,
              title: const Text('Home2'),
            ),
          ),
          ProductsScreen(),
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              centerTitle: true,
              elevation: 0,
              title: const Text('Home4'),
            ),
          )
        ],
      ),
    );
  }
}

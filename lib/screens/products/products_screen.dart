import 'package:flutter/material.dart';
import 'package:loja_virt/common/drawer/custom_drawer.dart';
import 'package:loja_virt/resources/product_manager.dart';
import 'package:loja_virt/screens/products/components/product_list_tile.dart';
import 'package:provider/provider.dart';

import 'components/search_dialog.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Produtos'),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                final search = await showDialog<String>(
                    context: context, builder: (_) => SearchDialog());

                if (search != null) {
                  context.read<ProductManager>().search = search;
                }
              })
        ],
      ),
      body: Consumer<ProductManager>(
        builder: (_, productManager, __) {
          final filteredProducts = productManager.filteredProducts;
          return ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: filteredProducts.length,
            itemBuilder: (_, index) {
              return ProductListTile(filteredProducts[index]);
            },
          );
        },
      ),
    );
  }
}

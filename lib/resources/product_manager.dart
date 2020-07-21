import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:loja_virt/models/product.dart';

class ProductManager extends ChangeNotifier {
  final Firestore firestore = Firestore.instance;
  List<Product> allProducts = [];
  String _search = '';

  ProductManager() {
    _loadAllProducts();
  }

  String get search => _search;

  set search(String value) {
    this._search = value;
    notifyListeners();
  }

  List<Product> get filteredProducts {
    final List<Product> filteredProducts = [];

    if (search.isEmpty) {
      filteredProducts.addAll(allProducts);
    } else {
      filteredProducts.addAll(allProducts
          .where((p) => p.nome.toLowerCase().contains(search.toLowerCase())));
    }

    return filteredProducts;
  }

  Future<void> _loadAllProducts() async {
    QuerySnapshot snapDocs =
        await firestore.collection('products').getDocuments();

    allProducts =
        snapDocs.documents.map((d) => Product.fromDocument(d)).toList();

    notifyListeners();
  }
}

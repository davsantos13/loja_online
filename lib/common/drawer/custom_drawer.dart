import 'package:flutter/material.dart';
import 'package:loja_virt/common/drawer/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerTile(
            icon: Icons.home,
            title: "Início".toUpperCase(),
            page: 0,
          ),
          DrawerTile(
            icon: Icons.list,
            title: "Produtos".toUpperCase(),
            page: 1,
          ),
          DrawerTile(
            icon: Icons.playlist_add,
            title: "Pedidos".toUpperCase(),
            page: 2,
          ),
          DrawerTile(
            icon: Icons.location_on,
            title: "Início".toUpperCase(),
            page: 3,
          ),
        ],
      ),
    );
  }
}

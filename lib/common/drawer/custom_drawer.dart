import 'package:flutter/material.dart';
import 'package:loja_virt/common/drawer/custom_drawer_header.dart';
import 'package:loja_virt/common/drawer/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 203, 236, 241),
                  Colors.white
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          const Divider(),
          ListView(
            children: [
              CustomDrawerHeader(),
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
        ],
      ),
    );
  }
}

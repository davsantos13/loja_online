import 'package:flutter/material.dart';
import 'package:loja_virt/models/page_manager.dart';
import 'package:provider/provider.dart';

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final int page;

  DrawerTile({this.icon, this.title, this.page});

  @override
  Widget build(BuildContext context) {
    final int curPage = context.watch<PageManager>().page;
    final Color primary = Theme.of(context).primaryColor;

    return InkWell(
      onTap: () {
        context.read<PageManager>().setPage(page);
      },
      child: SizedBox(
        height: 60,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Icon(
                icon,
                size: 32,
                color: curPage == page ? primary : Colors.grey[700],
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: curPage == page ? primary : Colors.grey[700],
              ),
            )
          ],
        ),
      ),
    );
  }
}

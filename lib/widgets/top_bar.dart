import 'package:flutter/material.dart';

class TopBarWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () {
          Navigator.of(context).pop(); 
        },
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.print, color: Colors.black),
          onPressed: () {
            print("Imprimir");
          },
        ),
        IconButton(
          icon: Icon(Icons.download, color: Colors.black),
          onPressed: () {
            print("Download");
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(30); // Altura do AppBar
}

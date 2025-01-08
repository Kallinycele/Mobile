import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabSelected;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(), 
      notchMargin: 8.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.bar_chart,
                color: currentIndex == 0 ? Colors.yellow : Colors.grey),
            onPressed: () => onTabSelected(0),
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.search,
                color: currentIndex == 2 ? Colors.yellow : Colors.grey),
            onPressed: () => onTabSelected(2),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomAppbar extends StatefulWidget with PreferredSizeWidget {
  final String title;

  const CustomAppbar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(50);

}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.black),
      elevation: 0,
      centerTitle: true,
      title: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
        color: Colors.black,
        child: Text(
          widget.title,
          style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.white)
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/wishlist');
            },
            icon: const Icon(Icons.favorite))
      ],
    );
  }
}

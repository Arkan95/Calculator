import 'package:flutter/material.dart';

class DisplayView extends StatefulWidget {
  const DisplayView({super.key});

  @override
  State<DisplayView> createState() => _DisplayViewState();
}

class _DisplayViewState extends State<DisplayView> {
  Widget changeMode() {
    return Container(
      width: 120,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: Theme.of(context).primaryColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.dark_mode_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.light_mode_outlined),
            onPressed: () {},
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: changeMode(),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            color: Colors.amber,
          ),
        ))
      ],
    );
  }
}


import 'package:flop/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DescriptionScreen extends StatelessWidget {
  const DescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Шлеппа - это моя жизнь'),
          ),
          body: ListView(
            children: [
              Image.network(
                'https://media.sketchfab.com/models/6a298927c97c4feaa6cae0ba21cadf73/thumbnails/49246466a0b346f9b1d8be542257c46c/69d1cb01171a4572a67d8d99bbeba645.jpeg',
                width: 600.0,
                height: 240.0,
                fit: BoxFit.cover,
              ),
              DescriptionTitle(),
              DescriptionText(),
            ],
          )
      ),
    );
  }
}



import 'package:flutter/material.dart';

class DescriptionTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32.0),
      child: const Text(
        "Большой Шлёпа",
        softWrap: true,
      ),
    );
  }
}
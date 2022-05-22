import 'package:flutter/material.dart';

class DescriptionPage extends StatelessWidget {
  final String id;
  const DescriptionPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(id),
      ),
    );
  }
}

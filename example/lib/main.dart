import 'dart:developer';

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_image_multi_grid_selection/flutter_image_multi_grid_selection.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImageGridSelectorExample(),
    );
  }
}

class ImageGridSelectorExample extends StatelessWidget {
  ImageGridSelectorExample({super.key});
  String imageURL =
      'https://res.cloudinary.com/vertexinspector/image/upload/v1678793934/inspection-images/mjujbtrvgtjuv3z3hlo0.jpg'; //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ImageGridSelector(
        image: NetworkImage(imageURL),
        rows: 4,
        columns: 4,
        gridColor: Colors.green,
        overlayColor: Colors.orangeAccent.withOpacity(0.5),
        onCellsSelected: (selectedCells) {
          log('Selected cells: ${selectedCells.toString()}');
        },
      ),
    ));
  }
}

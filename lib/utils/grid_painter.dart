import 'package:flutter/material.dart';

import 'cell.dart';

class GridPainter extends CustomPainter {
  final int rows;
  final int columns;
  final Color gridColor;
  final double width;
  final double height;
  final List<Cell> selectedCells;
  final double cellSize;

  GridPainter({
    required this.rows,
    required this.columns,
    required this.gridColor,
    required this.width,
    required this.height,
    required this.selectedCells,
    required this.cellSize,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double cellWidth = width / columns;
    double cellHeight = height / rows;

    Paint linePaint = Paint()
      ..color = gridColor
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    for (int i = 0; i <= rows; i++) {
      double y = i * cellHeight;
      canvas.drawLine(Offset(0, y), Offset(width, y), linePaint);
    }

    for (int j = 0; j <= columns; j++) {
      double x = j * cellWidth;
      canvas.drawLine(Offset(x, 0), Offset(x, height), linePaint);
    }

    Paint selectedPaint = Paint()
      ..color = Colors.red.withOpacity(0.5)
      ..style = PaintingStyle.fill;

    for (Cell cell in selectedCells) {
      double x = (cell.column - 1) * cellSize;
      double y = (cell.row - 1) * cellSize;
      Rect cellRect = Rect.fromLTWH(x, y, cellSize, cellSize);
      canvas.drawRect(cellRect, selectedPaint);
    }
  }

  @override
  bool shouldRepaint(GridPainter oldDelegate) =>
      selectedCells != oldDelegate.selectedCells;
}

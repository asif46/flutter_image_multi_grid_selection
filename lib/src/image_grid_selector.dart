library flutter_image_multi_grid_selection;

import 'package:flutter/material.dart';
import '../utils/cell.dart';

class ImageGridSelector extends StatefulWidget {
  final ImageProvider image;
  final int rows;
  final int columns;
  final Color gridColor;
  final Color overlayColor;
  final Function(List<Cell>)? onCellsSelected;

  const ImageGridSelector({
    super.key,
    required this.image,
    required this.rows,
    required this.columns,
    this.gridColor = Colors.red,
    this.overlayColor = const Color.fromRGBO(255, 0, 0, 0.3),
    this.onCellsSelected,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ImageGridSelectorState createState() => _ImageGridSelectorState();
}

class _ImageGridSelectorState extends State<ImageGridSelector> {
  final List<Cell> _selectedCells = [];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double width = constraints.maxWidth;
        double height = constraints.maxHeight;

        // Calculate the size of each grid cell
        double cellWidth = width / widget.columns;
        double cellHeight = height / widget.rows;

        // Create the list of grid cells
        List<Widget> cells = [];
        for (int row = 1; row <= widget.rows; row++) {
          for (int column = 1; column <= widget.columns; column++) {
            Cell cell = Cell(row: row, column: column);
            cells.add(
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (_selectedCells.contains(cell)) {
                      _selectedCells.remove(cell);
                    } else {
                      _selectedCells.add(cell);
                    }
                  });
                  if (widget.onCellsSelected != null) {
                    widget.onCellsSelected!(_selectedCells);
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: widget.gridColor),
                    color: _selectedCells.contains(cell)
                        ? widget.overlayColor
                        : null,
                  ),
                ),
              ),
            );
          }
        }

        return Stack(
          children: [
            Image(
              image: widget.image,
              fit: BoxFit.cover,
              width: width,
              height: height,
            ),
            GridView.count(
              crossAxisCount: widget.columns,
              childAspectRatio: cellWidth / cellHeight,
              children: cells,
            ),
          ],
        );
      },
    );
  }
}

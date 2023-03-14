class Cell {
  final int row;
  final int column;

  Cell({
    required this.row,
    required this.column,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Cell &&
          runtimeType == other.runtimeType &&
          row == other.row &&
          column == other.column;

  @override
  int get hashCode => row.hashCode ^ column.hashCode;

  @override
  String toString() {
    return '($row, $column)';
  }
}

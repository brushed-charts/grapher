import 'package:grapher/filter/dataStruct/point.dart';

class Anchor extends Point2D {
  final int groupID;
  Anchor(DateTime x, double y, this.groupID) : super(x, y);

  @override
  String toString() {
    return 'Anchor(group: $groupID, x: $x, y: ${(y as double).toStringAsFixed(8)})';
  }
}

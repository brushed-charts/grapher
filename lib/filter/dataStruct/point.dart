import 'package:grapher/filter/dataStruct/timeseries2D.dart';

class Point2D extends Timeseries2D {
  double yMin, yMax;
  Point2D(DateTime x, double y)
      : yMin = y,
        yMax = y,
        super(x, y);

  @override
  String toString() {
    return 'Point2D(x: $x, y: ${(y as double).toStringAsFixed(8)})';
  }
}

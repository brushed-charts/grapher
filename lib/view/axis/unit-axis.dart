import 'axis.dart';

class UnitAxis extends Axis {
  late double unitLength;
  late var dateUnits = <DateTime>[];

  UnitAxis();

  UnitAxis.copy(UnitAxis ref)
      : unitLength = ref.unitLength,
        super.copy(ref);

  UnitAxis copy() => UnitAxis.copy(this);

  double? toPixel(DateTime dateToConvert) {
    final index = dateUnits.indexOf(dateToConvert);
    if (index == -1) return null;
    return index * unitLength - unitLength / 2;
  }

  DateTime? toDate(double pixel) {
    final index = (pixel / unitLength).floor();
    if (index < 0 || index > dateUnits.length) return null;
    final date = dateUnits[index];
    return date;
  }

  @override
  set zoom(double value) {
    final delta = zoom - value;
    unitLength += delta;
    super.zoom = value;
  }
}

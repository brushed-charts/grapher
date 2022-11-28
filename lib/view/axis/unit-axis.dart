import 'axis.dart';

class UnitAxis extends Axis {
  late double unitLength;
  var dateUnits = <DateTime>[];

  UnitAxis();

  UnitAxis.copy(UnitAxis ref)
      : unitLength = ref.unitLength,
        dateUnits = ref.dateUnits,
        super.copy(ref);

  UnitAxis copy() => UnitAxis.copy(this);

  double? toPixel(DateTime dateToConvert) {
    final index = dateUnits.indexOf(dateToConvert);
    if (index == -1) return null;
    final count = dateUnits.length;
    final reversedIndex = count - 1 - index;
    final upperBound = pixelRange.max;
    final x = upperBound - (reversedIndex * unitLength + unitLength / 2);
    return x;
  }

  DateTime? toVirtual(double pixel) {
    final upperBound = pixelRange.max;
    final reversedPixel = upperBound - pixel;
    final index = (reversedPixel / unitLength).floor();
    if (index < 0 || index >= dateUnits.length) return null;
    final date = dateUnits.reversed.toList()[index];
    return date;
  }

  @override
  set zoom(double value) {
    final delta = zoom - value;
    unitLength += delta;
    super.zoom = value;
  }
}

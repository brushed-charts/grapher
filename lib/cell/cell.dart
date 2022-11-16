import 'package:flutter/gestures.dart';
import 'package:grapher/cell/event.dart';
import 'package:grapher/drawUnit/draw-unit-object.dart';
import 'package:grapher/drawUnit/drawunit.dart';
import 'package:grapher/pointer/helper/hit.dart';
import 'package:grapher/pointer/helper/hover.dart';
import 'package:grapher/view/view-event.dart';
import '../drawUnit/metadata.dart';

class Cell extends DrawUnit with HitHelper, HoverHelper {
  Cell(DrawUnitMetadata metadata, DrawUnitObject template)
      : super(metadata, template) {
    hitAddEventListeners();
    hoverAddEventListeners();
  }

  Cell.template({required DrawUnitObject child}) : super.template(child: child);

  Cell instanciate(DrawUnitMetadata metadata) {
    return Cell(metadata, child);
  }

  @override
  void onHover(PointerHoverEvent event) {
    if (!isTappingOnSelf(event.localPosition)) return;
    final dateTouched = positionToDatetime(event.localPosition);
    final cellEvent = CellEvent(this, event, null, dateTouched);
    propagate(cellEvent);
  }

  @override
  void onTapDown(covariant TapDownDetails event) {
    if (!isTappingOnSelf(event.localPosition)) return;
    final hitObject = getHitChild(event.localPosition);
    final dateTouched = positionToDatetime(event.localPosition);
    final cellEvent = CellEvent(this, event, hitObject, dateTouched);
    propagate(cellEvent);
  }

  bool isTappingOnSelf(Offset position) {
    if (baseDrawEvent == null) return false;
    if (!isHit(position)) return false;
    return true;
  }

  DrawUnitObject? getHitChild(Offset position) {
    if (child.isHit(position)) return child;
    return null;
  }

  DateTime positionToDatetime(Offset pos) {
    final viewEvent = (baseDrawEvent as ViewEvent);
    final date = viewEvent.xAxis.toVirtual(pos.dx);
    return date!;
  }
}

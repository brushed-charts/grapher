import 'package:grapher/filter/dataStruct/data2D.dart';
import 'package:grapher/group/factor.dart';
import 'package:grapher/kernel/object.dart';
import 'package:grapher/kernel/propagator/single.dart';
import 'package:grapher/view/view-event.dart';
import 'package:grapher/view/viewable.dart';

class ExtractDesiredGroupID extends Viewable with SinglePropagator {
  final int authorizedGroupID;
  Iterable<Data2D?>? chainData;

  ExtractDesiredGroupID(this.authorizedGroupID, GraphObject? child) {
    this.child = child;
    eventRegistry.add(GroupFactor, (p0) => onIncomingGroupFactor(p0));
  }

  @override
  void draw(ViewEvent event) {
    super.draw(event);
    if (chainData == null) return;
    generateAndPropagateViewEvent();
  }

  onIncomingGroupFactor(GroupFactor group) {
    chainData = group.getByID(authorizedGroupID);
  }

  void generateAndPropagateViewEvent() {
    final updatedEvent = (baseDrawEvent as ViewEvent).copy();
    updatedEvent.chainData = this.chainData!;
    propagate(updatedEvent);
  }
}

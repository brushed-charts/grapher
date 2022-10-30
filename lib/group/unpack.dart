import 'package:grapher/group/extractor.dart';
import 'package:grapher/kernel/copyable.dart';
import 'package:grapher/kernel/linkEvent.dart';
import 'package:grapher/kernel/object.dart';
import 'package:grapher/kernel/propagator/single.dart';
import 'package:grapher/staticLayout/stack.dart';
import 'package:grapher/view/view-event.dart';

import 'factorize.dart';

class UnpackToStackByGroupID extends FactorizeByGroupID with SinglePropagator {
  final Copyable template;
  UnpackToStackByGroupID({required String tagPrefix, required this.template})
      : super(tagPrefix: tagPrefix) {}

  @override
  void draw(ViewEvent event) {
    super.draw(event);
    handleEmptyGroup();
    handleGroups();
  }

  void handleEmptyGroup() {
    if (stackLayerNeeded() > 0) return;
    useTemplateAsDefaultChild();
    propagateViewEventWithNullChainData();
  }

  void handleGroups() {
    if (stackLayerNeeded() == 0) return;
    useTemplateToCreateChild();
    propagateGroupFactor();
  }

  void useTemplateToCreateChild() {
    final childrenCount = stackLayerNeeded();
    final children = <GraphObject>[];
    for (var i = 0; i < childrenCount; i++) {
      final subChild = template.copy();
      final currentGroupID = groupFactorized.getIDByIndex(i);
      final child = ExtractDesiredGroupID(currentGroupID, subChild);
      children.add(child);
    }
    child = StackLayout(children: children);
  }

  void propagateViewEventWithNullChainData() {
    final editedEvent = (baseDrawEvent as ViewEvent).copy();
    final dataLength = editedEvent.chainData.length;
    editedEvent.chainData = List.filled(dataLength, null);
    propagate(KernelLinkEvent(kernel!));
    propagate(editedEvent);
  }

  void propagateGroupFactor() {
    propagate(KernelLinkEvent(kernel!));
    propagate(groupFactorized);
    propagate(baseDrawEvent);
  }

  void useTemplateAsDefaultChild() {
    child = template;
  }

  int stackLayerNeeded() {
    return groupFactorized.count();
  }
}

import 'package:grapher/filter/group-contract.dart';
import 'package:grapher/filter/incoming-data.dart';
import 'package:grapher/kernel/object.dart';
import 'package:grapher/tag/property.dart';

import '../kernel/propagator/single.dart';
import '../tag/tagged-box.dart';

class TagUsingGroupID extends GraphObject with SinglePropagator {
  final GraphObject? child;
  final String prefix;
  final TagProperty property;

  TagUsingGroupID(
      {required this.prefix, this.property = TagProperty.basic, this.child}) {
    eventRegistry.add(IncomingData, (e) => onIncommingEvent(e as IncomingData));
  }

  void onIncommingEvent(IncomingData inputToTag) {
    if (!isValid(inputToTag)) return;
    final content = inputToTag.content;
    final tagName = generateTagName(content);
    final tag = TaggedBox(tagName, property, content);
    final event = IncomingData(tag);
    propagate(event);
  }

  String generateTagName(GroupDataStruct group) {
    return '${prefix}_${group.groupID}';
  }

  bool isValid(IncomingData inputToTag) {
    if (inputToTag.content == null) return false;
    if (inputToTag.content is! GroupDataStruct) return false;
    return true;
  }
}

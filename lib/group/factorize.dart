import 'package:grapher/filter/group-contract.dart';
import 'package:grapher/group/factor.dart';
import 'package:grapher/view/view-event.dart';
import 'package:grapher/view/viewable.dart';

import '../pack/packet.dart';

abstract class FactorizeByGroupID extends Viewable {
  final String tagPrefix;
  late GroupFactor groupFactorized;

  FactorizeByGroupID({required this.tagPrefix});

  @override
  void draw(ViewEvent event) {
    super.draw(event);
    initGroupFactor();
  }

  void initGroupFactor() {
    groupFactorized = GroupFactor();
    final event = (baseDrawEvent as ViewEvent);
    final setOfGroupID = getGroupIDList(event);
    foreachIDExtractChainToGroupFactor(setOfGroupID);
  }

  void foreachIDExtractChainToGroupFactor(Set<int> setOfGroupID) {
    for (final id in setOfGroupID) {
      final chainGroup = extractGroupByIDKeepingIndex(id);
      groupFactorized.add(id, chainGroup.toList());
    }
  }

  Set<int> getGroupIDList(ViewEvent event) {
    final packets = event.chainData.cast<Packet>();
    final idSet = Set<int>();
    for (final packet in packets) {
      for (final tag in packet.yTags) {
        if (tag.content is! GroupDataStruct) continue;
        final group = (tag.content as GroupDataStruct);
        idSet.add(group.groupID);
      }
    }
    return idSet;
  }

  Iterable<GroupDataStruct?> extractGroupByIDKeepingIndex(int idToKeep) {
    final packets = (baseDrawEvent as ViewEvent).chainData.cast<Packet>();
    final content = <GroupDataStruct?>[];
    for (final packet in packets) {
      GroupDataStruct? matchingGroup = null;
      for (final tag in packet.yTags) {
        if (tag.content is! GroupDataStruct) continue;
        final group = tag.content as GroupDataStruct;
        if (group.groupID != idToKeep) continue;
        matchingGroup = group;
      }
      content.add(matchingGroup);
    }
    return content;
  }
}

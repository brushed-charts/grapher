import 'package:grapher/filter/group-contract.dart';
import 'package:grapher/kernel/object.dart';

import '../view/view-event.dart';

class GroupFactor {
  final _content = Map<int, List<GroupDataStruct?>>();

  void add(int groupID, List<GroupDataStruct?> struct) {
    _content[groupID] = struct;
  }

  int count() {
    return _content.length;
  }

  List<GroupDataStruct?>? getByID(int groupID) {
    return _content[groupID];
  }

  int getIDByIndex(int index) {
    return _content.keys.elementAt(index);
  }
}

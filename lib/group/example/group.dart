import 'package:grapher/filter/dataStruct/data2D.dart';
import 'package:grapher/filter/group-contract.dart';

class Group extends Data2D implements GroupDataStruct {
  final int _group;

  Group(this._group);
  @override
  int get groupID => _group;

  @override
  double get timestamp => throw UnimplementedError();

  @override
  double toDouble() {
    throw UnimplementedError();
  }

  @override
  bool tryToInsert(Data2D data) {
    throw UnimplementedError();
  }

  @override
  DateTime get x => throw UnimplementedError();

  @override
  get y => throw UnimplementedError();

  @override
  double get yMax => throw UnimplementedError();

  @override
  double get yMin => throw UnimplementedError();
}

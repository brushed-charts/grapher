import 'package:grapher/filter/incoming-data.dart';
import 'package:grapher/kernel/object.dart';
import 'package:grapher/kernel/propagator/endline.dart';
import 'package:grapher/tag/tagged-box.dart';
import 'package:grapher/group/example/group.dart';

class TagTester extends GraphObject with EndlinePropagator {
  int counterOne = 0;
  int counterTen = 0;

  TagTester() {
    eventRegistry.add(IncomingData, (event) => onEvent(event as IncomingData));
  }

  void onEvent(IncomingData event) {
    if (event.content is! TaggedBox) return;
    TaggedBox tag = event.content;
    if (tag.content is! Group) return;
    if (tag.name == 'tag_test_1') counterOne++;
    if (tag.name == 'tag_test_10') counterTen++;
    if (counterOne == 3 && counterTen == 2) print('test succeed');
  }
}

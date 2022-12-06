import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grapher/kernel/kernel.dart';
import 'package:grapher/reference/example/reference_tester.dart';
import 'package:grapher/reference/main.dart';
import 'package:grapher/reference/memory_repository.dart';

void main() {
  final repository = ReferenceRepositoryInMemory();
  final graph = GraphKernel(
      child: Reference(
    name: "reference_tester",
    repository: repository,
    child: ReferenceTester(),
  ));

  final tester = repository.access<ReferenceTester>("reference_tester");
  tester?.test();
}

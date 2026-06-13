import 'package:isar/isar.dart';

part 'stardust_ledger_schema.g.dart';

@collection
class StardustLedgerEntry {
  Id id = Isar.autoIncrement;

  late DateTime timestamp;
  late int amount;
  late String source; // e.g. "completion", "quest", "achievement", "milestone"
  String? referenceId;
}

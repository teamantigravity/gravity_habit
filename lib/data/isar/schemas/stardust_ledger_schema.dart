import 'package:json_annotation/json_annotation.dart';

part 'stardust_ledger_schema.g.dart';

@JsonSerializable()
class StardustLedgerEntry {
  StardustLedgerEntry();

  factory StardustLedgerEntry.fromJson(Map<String, dynamic> json) =>
      _$StardustLedgerEntryFromJson(json);
  int? id;

  late DateTime timestamp;
  late int amount;
  late String source; // e.g. "completion", "quest", "achievement", "milestone"
  String? referenceId;
  Map<String, dynamic> toJson() => _$StardustLedgerEntryToJson(this);
}

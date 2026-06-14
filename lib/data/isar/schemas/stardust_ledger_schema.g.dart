// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stardust_ledger_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StardustLedgerEntry _$StardustLedgerEntryFromJson(Map<String, dynamic> json) =>
    StardustLedgerEntry()
      ..id = (json['id'] as num?)?.toInt()
      ..timestamp = DateTime.parse(json['timestamp'] as String)
      ..amount = (json['amount'] as num).toInt()
      ..source = json['source'] as String
      ..referenceId = json['referenceId'] as String?;

Map<String, dynamic> _$StardustLedgerEntryToJson(
        StardustLedgerEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timestamp': instance.timestamp.toIso8601String(),
      'amount': instance.amount,
      'source': instance.source,
      'referenceId': instance.referenceId,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_detail_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AccountDetailResponseAdapter extends TypeAdapter<AccountDetailResponse> {
  @override
  final int typeId = 6;

  @override
  AccountDetailResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AccountDetailResponse(
      accountDetail: fields[0] as AccountDetailModel?,
      activities: (fields[1] as List?)?.cast<CardActivity>(),
    ).._expireDate = fields[2] as int;
  }

  @override
  void write(BinaryWriter writer, AccountDetailResponse obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.accountDetail)
      ..writeByte(1)
      ..write(obj.activities)
      ..writeByte(2)
      ..write(obj._expireDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountDetailResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountDetailResponse _$AccountDetailResponseFromJson(
        Map<String, dynamic> json) =>
    AccountDetailResponse(
      accountDetail: json['accountDetail'] == null
          ? null
          : AccountDetailModel.fromJson(
              json['accountDetail'] as Map<String, dynamic>),
      activities: (json['activities'] as List<dynamic>?)
          ?.map((e) => CardActivity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AccountDetailResponseToJson(
        AccountDetailResponse instance) =>
    <String, dynamic>{
      'accountDetail': instance.accountDetail,
      'activities': instance.activities,
    };

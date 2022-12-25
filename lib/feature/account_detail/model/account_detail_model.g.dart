// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_detail_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AccountDetailModelAdapter extends TypeAdapter<AccountDetailModel> {
  @override
  final int typeId = 7;

  @override
  AccountDetailModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AccountDetailModel(
      accountNumber: fields[0] as String?,
      currencySymbol: fields[1] as String?,
      cutOffDate: fields[2] as String?,
      remainingDebt: fields[3] as String?,
      balance: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AccountDetailModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.accountNumber)
      ..writeByte(1)
      ..write(obj.currencySymbol)
      ..writeByte(2)
      ..write(obj.cutOffDate)
      ..writeByte(3)
      ..write(obj.remainingDebt)
      ..writeByte(4)
      ..write(obj.balance);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountDetailModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountDetailModel _$AccountDetailModelFromJson(Map<String, dynamic> json) =>
    AccountDetailModel(
      accountNumber: json['accountNumber'] as String?,
      currencySymbol: json['currencySymbol'] as String?,
      cutOffDate: json['cutOffDate'] as String?,
      remainingDebt: json['remainingDebt'] as String?,
      balance: json['balance'] as String?,
    );

Map<String, dynamic> _$AccountDetailModelToJson(AccountDetailModel instance) =>
    <String, dynamic>{
      'accountNumber': instance.accountNumber,
      'currencySymbol': instance.currencySymbol,
      'cutOffDate': instance.cutOffDate,
      'remainingDebt': instance.remainingDebt,
      'balance': instance.balance,
    };

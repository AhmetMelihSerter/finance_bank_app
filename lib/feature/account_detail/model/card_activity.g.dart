// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_activity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CardActivityAdapter extends TypeAdapter<CardActivity> {
  @override
  final int typeId = 8;

  @override
  CardActivity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CardActivity(
      title: fields[0] as String?,
      subTitle: fields[2] as String?,
      currencySymbol: fields[3] as String?,
      isSpend: fields[5] as bool?,
      iconUrl: fields[4] as String?,
      balance: fields[6] as String?,
      month: fields[1] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, CardActivity obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.month)
      ..writeByte(2)
      ..write(obj.subTitle)
      ..writeByte(3)
      ..write(obj.currencySymbol)
      ..writeByte(4)
      ..write(obj.iconUrl)
      ..writeByte(5)
      ..write(obj.isSpend)
      ..writeByte(6)
      ..write(obj.balance);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CardActivityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardActivity _$CardActivityFromJson(Map<String, dynamic> json) => CardActivity(
      title: json['title'] as String?,
      subTitle: json['subTitle'] as String?,
      currencySymbol: json['currencySymbol'] as String?,
      isSpend: json['isSpend'] as bool?,
      iconUrl: json['iconUrl'] as String?,
      balance: json['balance'] as String?,
      month: json['month'] as int?,
    );

Map<String, dynamic> _$CardActivityToJson(CardActivity instance) =>
    <String, dynamic>{
      'title': instance.title,
      'month': instance.month,
      'subTitle': instance.subTitle,
      'currencySymbol': instance.currencySymbol,
      'iconUrl': instance.iconUrl,
      'isSpend': instance.isSpend,
      'balance': instance.balance,
    };

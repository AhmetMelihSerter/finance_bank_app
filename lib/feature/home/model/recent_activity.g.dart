// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_activity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecentActivityAdapter extends TypeAdapter<RecentActivity> {
  @override
  final int typeId = 5;

  @override
  RecentActivity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecentActivity(
      title: fields[0] as String?,
      subTitle: fields[1] as String?,
      currencySymbol: fields[2] as String?,
      isSpend: fields[4] as bool?,
      iconUrl: fields[3] as String?,
      balance: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, RecentActivity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.subTitle)
      ..writeByte(2)
      ..write(obj.currencySymbol)
      ..writeByte(3)
      ..write(obj.iconUrl)
      ..writeByte(4)
      ..write(obj.isSpend)
      ..writeByte(5)
      ..write(obj.balance);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecentActivityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecentActivity _$RecentActivityFromJson(Map<String, dynamic> json) =>
    RecentActivity(
      title: json['title'] as String?,
      subTitle: json['subTitle'] as String?,
      currencySymbol: json['currencySymbol'] as String?,
      isSpend: json['isSpend'] as bool?,
      iconUrl: json['iconUrl'] as String?,
      balance: json['balance'] as String?,
    );

Map<String, dynamic> _$RecentActivityToJson(RecentActivity instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subTitle': instance.subTitle,
      'currencySymbol': instance.currencySymbol,
      'iconUrl': instance.iconUrl,
      'isSpend': instance.isSpend,
      'balance': instance.balance,
    };

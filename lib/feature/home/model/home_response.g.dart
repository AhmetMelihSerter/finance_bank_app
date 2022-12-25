// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HomeResponseAdapter extends TypeAdapter<HomeResponse> {
  @override
  final int typeId = 3;

  @override
  HomeResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomeResponse(
      myCards: (fields[0] as List?)?.cast<MyCard>(),
      recentActivities: (fields[1] as List?)?.cast<RecentActivity>(),
    ).._expireDate = fields[2] as int;
  }

  @override
  void write(BinaryWriter writer, HomeResponse obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.myCards)
      ..writeByte(1)
      ..write(obj.recentActivities)
      ..writeByte(2)
      ..write(obj._expireDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeResponse _$HomeResponseFromJson(Map<String, dynamic> json) => HomeResponse(
      myCards: (json['myCards'] as List<dynamic>?)
          ?.map((e) => MyCard.fromJson(e as Map<String, dynamic>))
          .toList(),
      recentActivities: (json['recentActivities'] as List<dynamic>?)
          ?.map((e) => RecentActivity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeResponseToJson(HomeResponse instance) =>
    <String, dynamic>{
      'myCards': instance.myCards,
      'recentActivities': instance.recentActivities,
    };

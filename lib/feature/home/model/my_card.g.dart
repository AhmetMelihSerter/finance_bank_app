// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_card.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyCardAdapter extends TypeAdapter<MyCard> {
  @override
  final int typeId = 4;

  @override
  MyCard read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyCard(
      balance: fields[0] as String?,
      currencySymbol: fields[1] as String?,
      cardNumber: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MyCard obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.balance)
      ..writeByte(1)
      ..write(obj.currencySymbol)
      ..writeByte(2)
      ..write(obj.cardNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyCardAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyCard _$MyCardFromJson(Map<String, dynamic> json) => MyCard(
      balance: json['balance'] as String?,
      currencySymbol: json['currencySymbol'] as String?,
      cardNumber: json['cardNumber'] as String?,
    );

Map<String, dynamic> _$MyCardToJson(MyCard instance) => <String, dynamic>{
      'balance': instance.balance,
      'currencySymbol': instance.currencySymbol,
      'cardNumber': instance.cardNumber,
    };

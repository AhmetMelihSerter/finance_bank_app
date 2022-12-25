import 'package:equatable/equatable.dart';
import 'package:finance_bank_app/core/base/model/base_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'my_card.g.dart';

@HiveType(typeId: 4)
@JsonSerializable()
class MyCard extends BaseModel<MyCard> with HiveObjectMixin, EquatableMixin {
  MyCard({
    this.balance,
    this.currencySymbol,
    this.cardNumber,
  });

  factory MyCard.fromJson(Map<String, Object?> json) {
    return _$MyCardFromJson(json);
  }
  
  @HiveField(0)
  String? balance;
  @HiveField(1)
  String? currencySymbol;
  @HiveField(2)
  String? cardNumber;

  String get showBalance => '${currencySymbol ?? ''} ${balance ?? 0}';

  @override
  MyCard fromJson(Map<String, Object?> json) {
    return _$MyCardFromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$MyCardToJson(this);
  }

  @override
  List<Object> get props => [
        balance ?? '',
        currencySymbol ?? '',
        cardNumber ?? '',
      ];

  @override
  String toString() =>
      'MyCard(balance: $balance, currencySymbol: $currencySymbol, cardNumber: $cardNumber)';
}

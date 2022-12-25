import 'package:equatable/equatable.dart';
import 'package:finance_bank_app/core/base/model/base_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account_detail_model.g.dart';

@HiveType(typeId: 7)
@JsonSerializable()
class AccountDetailModel extends BaseModel<AccountDetailModel>
    with HiveObjectMixin, EquatableMixin {
  AccountDetailModel({
    this.accountNumber,
    this.currencySymbol,
    this.cutOffDate,
    this.remainingDebt,
    this.balance,
  });

  factory AccountDetailModel.fromJson(Map<String, Object?> json) {
    return _$AccountDetailModelFromJson(json);
  }

  @HiveField(0)
  String? accountNumber;

  @HiveField(1)
  String? currencySymbol;

  @HiveField(2)
  String? cutOffDate;

  @HiveField(3)
  String? remainingDebt;
  
  @HiveField(4)
  String? balance;

  String get showRemainingDebt =>
      '${currencySymbol ?? ''} ${remainingDebt ?? 0}';

  String get showBalance => '${currencySymbol ?? ''} ${balance ?? 0}';

  @override
  AccountDetailModel fromJson(Map<String, Object?> json) {
    return _$AccountDetailModelFromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$AccountDetailModelToJson(this);
  }

  @override
  List<Object> get props {
    return [
      accountNumber ?? '',
      currencySymbol ?? '',
      cutOffDate ?? '',
      remainingDebt ?? '',
      balance ?? '',
    ];
  }

  @override
  String toString() {
    return 'AccountDetailModel(accountNumber: $accountNumber, currencySymbol: $currencySymbol, cutOffDate: $cutOffDate, remainingDebt: $remainingDebt, balance: $balance)';
  }
}

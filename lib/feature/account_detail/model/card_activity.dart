import 'package:finance_bank_app/core/base/model/base_model.dart';
import 'package:finance_bank_app/product/constants/enums/asset_enum.dart';
import 'package:finance_bank_app/product/constants/enums/product_enum.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'card_activity.g.dart';

@HiveType(typeId: 8)
@JsonSerializable()
class CardActivity extends BaseModel<CardActivity> with HiveObjectMixin {
  CardActivity({
    this.title,
    this.subTitle,
    this.currencySymbol,
    this.isSpend,
    this.iconUrl,
    this.balance,
    this.month,
  });

  factory CardActivity.fromJson(Map<String, Object?> json) {
    return _$CardActivityFromJson(json);
  }

  @HiveField(0)
  String? title;

  @HiveField(1)
  int? month;

  @HiveField(2)
  String? subTitle;

  @HiveField(3)
  String? currencySymbol;

  @HiveField(4)
  String? iconUrl;

  @HiveField(5)
  bool? isSpend;

  @HiveField(6)
  String? balance;

  Month get getMonth =>
      month == null ? Month.january : Month.values[month! - 1];

  String get showBalance =>
      '${isSpend ?? false ? '-' : ''} ${currencySymbol ?? ''} ${balance ?? 0}';

  SvgAssets? get getIconUrl =>
      SvgAssets.values.firstWhere((element) => element.name == (iconUrl ?? ''));

  @override
  CardActivity fromJson(Map<String, Object?> json) {
    return _$CardActivityFromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$CardActivityToJson(this);
  }
}

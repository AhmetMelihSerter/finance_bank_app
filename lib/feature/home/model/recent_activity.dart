import 'package:equatable/equatable.dart';
import 'package:finance_bank_app/core/base/model/base_model.dart';
import 'package:finance_bank_app/product/constants/enums/asset_enum.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recent_activity.g.dart';

@HiveType(typeId: 5)
@JsonSerializable()
class RecentActivity extends BaseModel<RecentActivity>
    with HiveObjectMixin, EquatableMixin {
  RecentActivity({
    this.title,
    this.subTitle,
    this.currencySymbol,
    this.isSpend,
    this.iconUrl,
    this.balance,
  });

  factory RecentActivity.fromJson(Map<String, Object?> json) {
    return _$RecentActivityFromJson(json);
  }

  @HiveField(0)
  String? title;
  @HiveField(1)
  String? subTitle;
  @HiveField(2)
  String? currencySymbol;
  @HiveField(3)
  String? iconUrl;
  @HiveField(4)
  bool? isSpend;
  @HiveField(5)
  String? balance;

  SvgAssets? get getIconUrl =>
      SvgAssets.values.firstWhere((element) => element.name == (iconUrl ?? ''));

  String get showBalance =>
      '${isSpend ?? false ? '-' : ''} ${currencySymbol ?? ''} ${balance ?? 0}';

  @override
  RecentActivity fromJson(Map<String, Object?> json) {
    return _$RecentActivityFromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$RecentActivityToJson(this);
  }

  @override
  String toString() {
    return 'RecentActivities(title: $title, subTitle: $subTitle, currencySymbol: $currencySymbol, isSpend: $isSpend, balance: $balance)';
  }

  @override
  List<Object> get props {
    return [
      title ?? '',
      subTitle ?? '',
      currencySymbol ?? '',
      isSpend ?? '',
      balance ?? '',
    ];
  }
}

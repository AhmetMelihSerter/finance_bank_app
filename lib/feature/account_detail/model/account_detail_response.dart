import 'package:finance_bank_app/core/base/model/base_model.dart';
import 'package:finance_bank_app/feature/account_detail/model/account_detail_model.dart';
import 'package:finance_bank_app/feature/account_detail/model/card_activity.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account_detail_response.g.dart';

@HiveType(typeId: 6)
@JsonSerializable()
class AccountDetailResponse extends BaseModel<AccountDetailResponse>
    with HiveObjectMixin {
  AccountDetailResponse({
    this.accountDetail,
    this.activities,
    Duration? expireDate,
  }) : _expireDate = DateTime.now()
            .add(expireDate ?? const Duration(seconds: 20))
            .microsecondsSinceEpoch;

  factory AccountDetailResponse.fromJson(Map<String, Object?> json) {
    return _$AccountDetailResponseFromJson(json);
  }

  @HiveField(0)
  AccountDetailModel? accountDetail;

  @HiveField(1)
  List<CardActivity>? activities;

  @HiveField(2)
  int _expireDate;

  bool get isNotExpired =>
      !(DateTime.now().microsecondsSinceEpoch > _expireDate);

  @override
  AccountDetailResponse fromJson(Map<String, Object?> json) {
    return _$AccountDetailResponseFromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$AccountDetailResponseToJson(this);
  }

  @override
  String toString() {
    return 'AccountDetailResponse(accountDetail: $accountDetail, activities: $activities)';
  }
}

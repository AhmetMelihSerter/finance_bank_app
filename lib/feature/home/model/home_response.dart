import 'package:finance_bank_app/core/base/model/base_model.dart';
import 'package:finance_bank_app/feature/home/model/my_card.dart';
import 'package:finance_bank_app/feature/home/model/recent_activity.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_response.g.dart';

@HiveType(typeId: 3)
@JsonSerializable()
class HomeResponse extends BaseModel<HomeResponse> with HiveObjectMixin {
  HomeResponse({
    this.myCards,
    this.recentActivities,
    Duration? expireDate,
  }) : _expireDate = DateTime.now()
            .add(expireDate ?? const Duration(seconds: 20))
            .microsecondsSinceEpoch;

  factory HomeResponse.fromJson(Map<String, Object?> json) {
    return _$HomeResponseFromJson(json);
  }

  @HiveField(0)
  List<MyCard>? myCards;

  @HiveField(1)
  List<RecentActivity>? recentActivities;

  @HiveField(2)
  int _expireDate;

  bool get isNotExpired =>
      !(DateTime.now().microsecondsSinceEpoch > _expireDate);

  @override
  HomeResponse fromJson(Map<String, Object?> json) {
    return _$HomeResponseFromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$HomeResponseToJson(this);
  }
}

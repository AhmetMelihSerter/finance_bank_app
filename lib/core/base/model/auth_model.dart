import 'package:equatable/equatable.dart';
import 'package:finance_bank_app/core/base/model/base_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_model.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class AuthModel extends BaseModel<AuthModel>
    with HiveObjectMixin, EquatableMixin {
  AuthModel({
    this.token,
  });

  factory AuthModel.fromJson(Map<String, Object?> json) {
    return _$AuthModelFromJson(json);
  }

  @HiveField(0)
  String? token;

  @override
  AuthModel fromJson(Map<String, Object?> json) {
    return _$AuthModelFromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$AuthModelToJson(this);
  }

  @override
  List<Object?> get props => [
        token,
      ];
}

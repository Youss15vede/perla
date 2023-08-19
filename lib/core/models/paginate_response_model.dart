import 'package:perla/core/entities/paginate_list.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'paginate_response_model.g.dart';

@JsonSerializable()
class PaginateResponseModel<T extends Equatable> extends PaginateList {
  @JsonKey(name: 'total')
  final int count;
  @JsonKey(name: 'last_page')
  final int numPages;

  @_Converter()
  final List<T> data;

  const PaginateResponseModel({
    required this.count,
    required this.numPages,
    required this.data,
  }) : super(
    data: data,
    page: numPages,
  );

  factory PaginateResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PaginateResponseModelFromJson<T>(json);
}

class _Converter<T> implements JsonConverter<T, Object?> {
  const _Converter();

  @override
  T fromJson(Object? json) {
    debugPrint('T is ${T.toString()}');
    return json as T;
  }

  @override
  Object? toJson(T object) {
    // This will only work if `object` is a native JSON type:
    //   num, String, bool, null, etc
    // Or if it has a `toJson()` function`.
    return object!;
  }
}

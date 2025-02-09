import 'package:equatable/equatable.dart';
import 'package:flutter_tdd_clean_bloc/core/util/result.dart';

// ignore: one_member_abstracts
abstract interface class UseCase<Type, Params> {
  Result<Type> call(Params param);
}

class NoParam extends Equatable {
  @override
  List<Object?> get props => [];
}

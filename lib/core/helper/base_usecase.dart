import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

abstract class UseCaseNoParams<Type> {
  Future<Type> call();
}

abstract class UseCaseParamsId<Type, Params, Id> {
  Future<Type> call(Params params, Id id);
}
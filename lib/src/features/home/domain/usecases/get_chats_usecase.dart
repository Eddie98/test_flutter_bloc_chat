import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:test_flutter_bloc_chat/src/features/home/data/models/chat.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/home_repository.dart';

class GetChatsUseCase implements UseCase<ChatResponseModel, Params> {
  final HomeRepository _repository;
  const GetChatsUseCase(this._repository);

  @override
  Future<Either<Failure, ChatResponseModel>> call(
    Params? params,
  ) async {
    return await _repository.getChats(params);
  }
}

class Params extends Equatable {
  final int? page;

  const Params({
    this.page,
  });

  @override
  List<Object?> get props => [page];
}

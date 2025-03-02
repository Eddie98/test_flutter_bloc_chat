import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';
import '../../data/models/chat.dart';
import '../usecases/usecase_params.dart';

abstract class HomeRepository {
  Future<Either<Failure, ChatResponseModel>> getChats(
    GetChatsParams? params,
  );

}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_flutter_bloc_chat/src/features/home/data/models/chat.dart';

import '../../../../../core/utils/failure_converter.dart';
import '../../../domain/usecases/get_chats_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetChatsUseCase _getChatsUseCase;

  HomeBloc(
    this._getChatsUseCase,
  ) : super(HomeInitial()) {
    on<GetChatsEvent>(_getHotels);
  }

  Future<void> _getHotels(GetChatsEvent event, Emitter emit) async {
    emit(GetChatsLoadingState());

    final result = await _getChatsUseCase.call(null);

    result.fold(
      (l) => emit(GetChatsFailureState(mapFailureToMessage(l))),
      (r) => emit(GetChatsSuccessState(r)),
    );
  }



}

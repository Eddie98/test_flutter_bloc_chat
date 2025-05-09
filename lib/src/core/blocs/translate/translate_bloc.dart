import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'translate_event.dart';
part 'translate_state.dart';

class TranslateBloc extends HydratedBloc<TranslateEvent, TranslateState> {
  TranslateBloc() : super(const TranslateState('ru', 'RU', '7')) {
    on<TrRussianEvent>(_trRussia);
    on<TrKyrgyzEvent>(_trKyrgyz);
    on<TrEnglishEvent>(_trEnglish);
  }

  Future _trRussia(TrRussianEvent event, Emitter emit) async {
    emit(TranslateState('ru', 'RU', state.countryCode));
  }

  Future _trKyrgyz(TrKyrgyzEvent event, Emitter emit) async {
    emit(TranslateState('ky', 'KG', state.countryCode));
  }

  Future _trEnglish(TrEnglishEvent event, Emitter emit) async {
    emit(TranslateState('en', 'EN', state.countryCode));
  }

  @override
  TranslateState? fromJson(Map<String, dynamic> json) {
    return TranslateState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TranslateState state) {
    return state.toMap();
  }
}

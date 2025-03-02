part of 'translate_bloc.dart';

sealed class TranslateEvent extends Equatable {
  const TranslateEvent();

  @override
  List<Object> get props => [];
}

class TrKyrgyzEvent extends TranslateEvent {}

class TrRussianEvent extends TranslateEvent {}

class TrEnglishEvent extends TranslateEvent {}

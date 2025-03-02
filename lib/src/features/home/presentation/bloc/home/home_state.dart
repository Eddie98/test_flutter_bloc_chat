part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

class GetChatsLoadingState extends HomeState {}

class GetChatsSuccessState extends HomeState {
  final ChatResponseModel response;
  const GetChatsSuccessState(this.response);

  @override
  List<Object> get props => [response];
}

class GetChatsFailureState extends HomeState {
  final String message;
  const GetChatsFailureState(this.message);

  @override
  List<Object> get props => [message];
}

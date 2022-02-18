part of 'ip_bloc.dart';

abstract class IpState extends Equatable {
  const IpState();

  @override
  List<Object> get props => [];
}

class IpInitial extends IpState {}

class IpFetchingState extends IpState {}

class IpFetchedState extends IpState {
  final Ip ip;

  const IpFetchedState(this.ip);
  @override
  List<Object> get props => [ip];
}

class IpErrorState extends IpState {
  final String errorMessage;

  const IpErrorState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}

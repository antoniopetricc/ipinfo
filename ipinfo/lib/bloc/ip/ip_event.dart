part of 'ip_bloc.dart';

abstract class IpEvent extends Equatable {
  const IpEvent();

  @override
  List<Object> get props => [];
}

class IpSearchEvent extends IpEvent {
  final String ip;

  const IpSearchEvent(this.ip);
  @override
  List<Object> get props => [ip];
}

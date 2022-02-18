import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';
import 'package:ipinfo/models/ip.dart';
import 'package:ipinfo/repository/ip_repository.dart';

part 'ip_event.dart';
part 'ip_state.dart';

class IpBloc extends Bloc<IpEvent, IpState> {
  IpBloc({required this.ipRepository}) : super(IpInitial()) {
    on<IpSearchEvent>(_onIpSearchEvent);
  }

  final IpRepository ipRepository;

  Future _onIpSearchEvent(
    IpSearchEvent event,
    Emitter<IpState> emit,
  ) async {
    emit(IpFetchingState());
    try {
      final ip = await ipRepository.getIpInfo(event.ip);

      emit(IpFetchedState(ip));
    } catch (e) {
      emit(const IpErrorState("Ip not found"));
    }
  }
}

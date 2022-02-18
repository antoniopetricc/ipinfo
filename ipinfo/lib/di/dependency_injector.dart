import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ipinfo/bloc/ip/ip_bloc.dart';
import 'package:ipinfo/repository/ip_repository.dart';

class DependencyInjector extends StatelessWidget {
  const DependencyInjector({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return _repository(_bloc(child));
  }

  Widget _repository(Widget child) => RepositoryProvider(
        create: (context) => IpRepository(),
        child: child,
      );

  Widget _bloc(Widget child) => BlocProvider(
        create: (context) => IpBloc(
          ipRepository: context.read(),
        ),
        child: child,
      );
}

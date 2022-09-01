import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:position/src/modules/gps/bloc/gps_bloc.dart';
import 'package:position/src/modules/gps/views/gpspage.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GpsBloc, GpsState>(
        builder: (context, state) {
          return state.isAllGranted
              ? /* BlocProvider<AuthBloc>(
                  create: (context) => getIt<AuthBloc>()..add(AuthStarted()),
                  child: const InitPage(),
                )*/
              Container()
              : const GpsAccessPage();
        },
      ),
    );
  }
}

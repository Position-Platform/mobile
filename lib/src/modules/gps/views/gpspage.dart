import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:position/generated/l10n.dart';
import 'package:position/src/core/utils/colors.dart';
import 'package:position/src/modules/gps/bloc/gps_bloc.dart';

class GpsAccessPage extends StatelessWidget {
  const GpsAccessPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: BlocBuilder<GpsBloc, GpsState>(builder: (context, state) {
        return !state.isGpsEnabled
            ? const _EnableGpsMessage()
            : const _AccessBotton();
      })),
    );
  }
}

class _AccessBotton extends StatelessWidget {
  const _AccessBotton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).gpsAccess,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const Divider(
          height: 50,
          color: transparent,
        ),
        MaterialButton(
            color: primaryColor,
            splashColor: transparent,
            shape: const StadiumBorder(),
            elevation: 0,
            onPressed: () {
              final gpsBloc = BlocProvider.of<GpsBloc>(context);
              gpsBloc.askGpsAccess();
            },
            child: Text(
              S.of(context).askAccess,
              style: const TextStyle(color: Colors.white),
            ))
      ],
    );
  }
}

class _EnableGpsMessage extends StatelessWidget {
  const _EnableGpsMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      S.of(context).enableGps,
      style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
    );
  }
}

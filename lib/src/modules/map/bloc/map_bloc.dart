import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapboxMapController? mapController;
  MapBloc() : super(MapInitial()) {
    on<OnMapInitializedEvent>(_onInitMap);
  }

  _onInitMap(OnMapInitializedEvent event, Emitter<MapState> emit) async {
    mapController = event.controller;
  }
}

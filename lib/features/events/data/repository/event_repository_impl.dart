import 'dart:io';

import 'package:calentre/core/resources.dart';
import 'package:calentre/features/events/data/data_sources/event_service.dart';
import 'package:calentre/features/events/domain/reporsitory/event_repository.dart';

class EventRepositoryImpl implements EventRepository {
  EventRepositoryImpl(this._eventService);

  final EventService _eventService;
  @override
  Future<DataState<bool, Exception>> createEvent(
      Map<String, dynamic> param) async {
    try {
      final res = await _eventService.createEvent(param);
      return DataSuccess(res);
    } on SocketException {
      return DataFailure(Exception("Something is wrong with your internet"));
    } catch (e) {
      return DataFailure(Exception(e));
    }
  }

  @override
  Future deleteEvent() {
    // TODO: implement deleteEvent
    throw UnimplementedError();
  }

  @override
  Future getEvent() {
    // TODO: implement getEvent
    throw UnimplementedError();
  }

  @override
  Future updateEvent() {
    // TODO: implement updateEvent
    throw UnimplementedError();
  }
}

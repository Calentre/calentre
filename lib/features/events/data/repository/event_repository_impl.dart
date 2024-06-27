import 'dart:io';

import 'package:calentre/core/resources.dart';
import 'package:calentre/features/events/data/data_sources/event_service.dart';
import 'package:calentre/features/events/domain/reporsitory/event_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EventRepositoryImpl implements EventRepository {
  EventRepositoryImpl(this._eventService);

  final EventService _eventService;
  @override
  Future<DataState<bool, Exception>> createEvent(
      Map<String, dynamic> param) async {
    DataState<bool, Exception>? response;

    /// TODO: refactor error handling/design exception processing
    try {
      final isSuccessful = await _eventService.createEvent(param);
      if (isSuccessful) {
        response = DataSuccess(isSuccessful);
        return response;
      } else {
        return DataFailure(const AuthException(
            "Unable to sign this user in : CODE 1",
            statusCode: '500'));
      }
    } on Exception catch (e) {
      if (e is AuthException) {
        response = DataFailure(Exception(
          "Unable to create event : CODE 2",
        ));
        return response;
      } else if (e is SocketException) {
        response =
            DataFailure(Exception("Something was wrong with your internet"));
      }
      response = DataFailure(e);
    }

    return response;
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

import 'package:calentre/core/resources.dart';

abstract class EventRepository {
  Future<dynamic> getEvent();
  Future<DataState<bool, Exception>> createEvent(Map<String, dynamic> param);
  Future<dynamic> deleteEvent();
  Future<dynamic> updateEvent();
}

import 'package:calentre/core/resources.dart';

abstract class EventRepository {
  Future<dynamic> getEvent();
  Future<DataState<List, Exception>> createEvent(Map<String, dynamic> param);
  Future<dynamic> deleteEvent();
  Future<dynamic> updateEvent();
}

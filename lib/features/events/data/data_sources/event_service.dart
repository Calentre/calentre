import 'package:calentre/features/events/data/data_sources/event_mixin.dart';
import 'package:calentre/utils/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EventService implements EventMixin {
  EventService(this.supabase);

  final SupabaseClient supabase;

  @override
  Future<dynamic> createEvent(Map<String, dynamic> param) async {
    final res = await supabase.from('event').insert(param).select();
    CL.logSuccess('Event created $res');
    return true;
  }

  @override
  Future deleteEvent() {
    throw UnimplementedError();
  }

  @override
  Future getEvent() {
    throw UnimplementedError();
  }

  @override
  Future updateEvent() {
    throw UnimplementedError();
  }
}

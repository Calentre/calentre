import 'package:calentre/features/events/data/data_sources/event_mixin.dart';
import 'package:calentre/utils/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EventService implements EventMixin {
  EventService(this.supabase);

  final SupabaseClient supabase;

  @override
  Future<dynamic> createEvent(Map<String, dynamic> param) async {
    final res = await supabase.from('events').insert({
      'event_name': "Very first Test event",
      'event_description':
          "This is a simple event that shows that our supabase upsert works",
      'video_call_type': "google_meet",
      'duration': "25",
      'event_link': "https://dontknowhow.com/meeting_url",
      'event_type': "free_event",
      'amount': "0",
      'is_multiple': "no",
      'availability': {
        'monday': [
          {"start": "12AM", "end": "1AM"},
          {"start": "12AM", "end": "1AM"},
          {"start": "12AM", "end": "1AM"},
          {"start": "12AM", "end": "1AM"},
        ]
      }
    });

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

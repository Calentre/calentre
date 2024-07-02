import 'package:calentre/core/resources.dart';
import 'package:calentre/core/usecase.dart';
import 'package:calentre/features/events/domain/reporsitory/event_repository.dart';

class CreateEventUsesCase
    implements UseCase<DataState<List, Exception>, Map<String, dynamic>> {
  final EventRepository _eventRepository;

  CreateEventUsesCase(this._eventRepository);

  @override
  Future<DataState<List, Exception>> call({Map<String, dynamic>? param}) {
    return _eventRepository.createEvent(param!);
  }
}

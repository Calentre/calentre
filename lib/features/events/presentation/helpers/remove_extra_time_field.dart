import 'package:calentre/config/enums/weekdays.dart';
import 'package:calentre/features/events/presentation/bloc/event/event_bloc.dart';

void removeExtraTimeFieldHelper({
  required WeekDays day,
  required CalentreEventBloc calentreEventBloc,
}) {
  switch (day) {
    case WeekDays.monday:
      calentreEventBloc.days.monday!.removeLast();

      //remove last error in error list
      calentreEventBloc.errorList[0]["Mon"]!.removeLast();
      break;
    case WeekDays.tuesday:
      calentreEventBloc.days.tuesday!.removeLast();
      calentreEventBloc.errorList[1]["Tue"]!.removeLast();
      break;
    case WeekDays.wednesday:
      calentreEventBloc.days.wednesday!.removeLast();
      calentreEventBloc.errorList[2]["Wed"]!.removeLast();
      break;
    case WeekDays.thursday:
      calentreEventBloc.days.thursday!.removeLast();
      calentreEventBloc.errorList[3]["Thur"]!.removeLast();
      break;
    case WeekDays.friday:
      calentreEventBloc.days.friday!.removeLast();
      calentreEventBloc.errorList[4]["Fri"]!.removeLast();
      break;
    case WeekDays.saturday:
      calentreEventBloc.days.saturday!.removeLast();
      calentreEventBloc.errorList[5]["Sat"]!.removeLast();
      break;
    case WeekDays.sunday:
      calentreEventBloc.days.sunday!.removeLast();
      calentreEventBloc.errorList[6]["Sun"]!.removeLast();
      break;
    default:
  }
}

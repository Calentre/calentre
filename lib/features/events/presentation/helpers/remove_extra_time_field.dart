import 'package:calentre/features/events/presentation/bloc/event/event_bloc.dart';

void removeExtraTimeFieldHelper({
  required String day,
  required CalentreEventBloc calentreEventBloc,
}) {
  switch (day) {
    case "Mon":
      calentreEventBloc.days.monday!.removeLast();

      //remove last error in error list
      calentreEventBloc.errorList[0]["Mon"]!.removeLast();
      break;
    case "Tue":
      calentreEventBloc.days.tuesday!.removeLast();
      calentreEventBloc.errorList[1]["Tue"]!.removeLast();
      break;
    case "Wed":
      calentreEventBloc.days.wednesday!.removeLast();
      calentreEventBloc.errorList[2]["Wed"]!.removeLast();
      break;
    case "Thur":
      calentreEventBloc.days.thursday!.removeLast();
      calentreEventBloc.errorList[3]["Thur"]!.removeLast();
      break;
    case "Fri":
      calentreEventBloc.days.friday!.removeLast();
      calentreEventBloc.errorList[4]["Fri"]!.removeLast();
      break;
    case "Sat":
      calentreEventBloc.days.saturday!.removeLast();
      calentreEventBloc.errorList[5]["Sat"]!.removeLast();
      break;
    case "Sun":
      calentreEventBloc.days.sunday!.removeLast();
      calentreEventBloc.errorList[6]["Sun"]!.removeLast();
      break;
    default:
  }
}

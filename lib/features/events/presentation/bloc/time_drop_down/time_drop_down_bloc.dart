import 'package:calentre/features/events/presentation/bloc/event/event_bloc.dart';
import 'package:calentre/features/events/presentation/bloc/time_drop_down/time_drop_down_event.dart';
import 'package:calentre/features/events/presentation/bloc/time_drop_down/time_drop_down_state.dart';
import 'package:calentre/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimeDropDownBloc extends Bloc<TimeDropDownEvent, TimeDropDownState> {
  TimeDropDownBloc() : super(TimeDropDownState()) {
    on<SelectTimeDropDownValueEvent>(onClickDropDownItem);
    on<RebuildTimeDropDownEvent>(onTriggerRebuild);
  }
  String dropDownValue = "";
  bool isTimeError = false;

  void onClickDropDownItem(SelectTimeDropDownValueEvent event,
      Emitter<TimeDropDownState> emit) async {
    emit(TimeDropDownUpdatedState(value: dropDownValue));
  }

  void onTriggerRebuild(
      RebuildTimeDropDownEvent event, Emitter<TimeDropDownState> emit) {
    print("FormDropDownBloc rebuild triggered");
    emit(RebuildTimeDropDownState());
  }

  validateTimeDropDown({required String day, required int index}) {
    CalentreEventBloc calentreEventBloc = sl.get<CalentreEventBloc>();
    switch (day) {
      case "Mon":
        //if start time is greater than end time, return error
        String startTime = calentreEventBloc.days.monday![index].start!;
        String endTime = calentreEventBloc.days.monday![index].end!;

        int startTimeHour = getHourAndMeridiem(startTime)[0] == 12
            ? 0
            : getHourAndMeridiem(startTime)[0];
        int startTimeMinute = getHourAndMeridiem(startTime)[1];
        String startTimeMeridiem = getHourAndMeridiem(startTime)[2];

        int endTimeHour = getHourAndMeridiem(endTime)[0] == 12
            ? 0
            : getHourAndMeridiem(endTime)[0];
        ;
        int endTimeMinute = getHourAndMeridiem(endTime)[1];
        String endTimeMeridiem = getHourAndMeridiem(endTime)[2];

        if (startTimeMeridiem == "AM" && endTimeMeridiem == "PM") {
          //success
          isTimeError = false;
          print("An error" +
              "$endTimeHour" +
              "$endTimeMinute" +
              "$endTimeMeridiem");
        } else if (startTimeMeridiem == "PM" && endTimeMeridiem == "AM") {
          isTimeError = true;
        } else if (startTimeMeridiem == "AM" && endTimeMeridiem == "AM") {
          if (startTimeHour < endTimeHour) {
            isTimeError = false;
          } else if (startTimeHour > endTimeHour) {
            isTimeError = true;
          } else {
            if (startTimeMinute < endTimeMinute) {
              isTimeError = false;
            } else {
              isTimeError = true;
            }
          }
        } else if (startTimeMeridiem == "PM" && endTimeMeridiem == "PM") {
          if (startTimeHour < endTimeHour) {
            isTimeError = false;
          } else if (startTimeHour > endTimeHour) {
            isTimeError = true;
          } else {
            if (startTimeMinute < endTimeMinute) {
              isTimeError = false;
            } else {
              isTimeError = true;
            }
          }
        }

        //check the greater of the meridiem
        //check the greater of the numbers

        //4:05 PM - 2:50 PM
        //if start meridiem is AM and end is PM
        //success
        //if start is AM and end is AM
        //check if end time > than start
        //success
        //else failure
        //else if start is PM and end is AM
        //return error
        //else if PM and PM
        //check if end time > than startTime
        //success
        //else
        //error

        break;
      // case "Tue":
      //   tuesdayTimeList.timeList;
      //   break;
      // case "Wed":
      //   wednesdayTimeList.timeList;
      //   break;
      // case "Thur":
      //   thursdayTimeList.timeList;
      //   break;
      // case "Fri":
      //   fridayTimeList.timeList;
      //   break;
      // case "Sat":
      //   saturdayTimeList.timeList;
      //   break;
      // case "Sun":
      //   sundayTimeList.timeList;
      //   break;
      default:
        return "Start Time must be before end time ";
    }
  }
}

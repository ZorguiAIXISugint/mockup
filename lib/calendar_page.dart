import 'package:add_2_calendar/add_2_calendar.dart';

class CalendarService {

  writeCalendar() {
    final Event event = Event(
          title: 'Arbeiten',
          description: 'Erster Test',
          location: 'Hannover',
          startDate: DateTime(2019-07-20),
          endDate: DateTime(2019-07-21),
        );

    return event.description.toString();
    
    //Add2Calendar.addEvent2Cal(event);
    
  }

}

final CalendarService calendarservice = CalendarService();
  
  
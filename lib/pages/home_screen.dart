import 'package:animeop/widgets/calender_widget.dart';
import 'package:animeop/widgets/eventlist_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/providers/event_provider.dart';
import '../widgets/weather_widget.dart';
import 'event_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<EventProvider>(
      builder: (context, eventProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Good Morning,'),
            actions: [
              IconButton(
                  icon: const Icon(Icons.sunny_snowing), onPressed: () {}),
            ],
          ),
          body: Column(
            children: [
              // Calendar Widget
              CalendarWidget(
                events: eventProvider.events,
                onDaySelected: (selectedDay, focusedDay, _) {
                  eventProvider.selectDay(selectedDay);
                },
              ),
              const SizedBox(height: 30),
              const WeatherWidget(),
              Expanded(
                child: ListView.builder(
                  itemCount: eventProvider.eventsForSelectedDay.length,
                  itemBuilder: (context, index) {
                    final event = eventProvider.eventsForSelectedDay[index];

                    // Wrap the EventListTile with Dismissible for swipe-to-delete functionality
                    return Dismissible(
                      key: Key(event.hashCode.toString()),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      onDismissed: (direction) {
                        eventProvider.deleteEvent(event);
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('${event.title} deleted')));
                      },
                      child: EventListTile(
                          event: event), // Pass the event including color
                    );
                  },
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EventsScreen()),
              );
            },
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:train_seats/constants/sized_box.dart';
import 'package:train_seats/utils/seat.dart';
import 'package:train_seats/utils/seat_type.dart';
import 'package:train_seats/widgets/seat_widget.dart';

class CompartmentLayout extends ConsumerWidget {
  const CompartmentLayout({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SeatWidget(
              seat: Seat(
                seatType: SeatType.upper,
                index: index * 8 + 1,
              ),
            ),
            buildWidth(5),
            SeatWidget(
              seat: Seat(
                seatType: SeatType.middle,
                index: index * 8 + 2,
              ),
            ),
            buildWidth(5),
            SeatWidget(
              seat: Seat(
                seatType: SeatType.lower,
                index: index * 8 + 3,
              ),
            ),
            buildWidth(50),
            SeatWidget(
              seat: Seat(
                seatType: SeatType.sideLower,
                index: index * 8 + 4,
              ),
            ),
          ],
        ),
        buildHeight(50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SeatWidget(
              seat: Seat(
                seatType: SeatType.upper,
                index: index * 8 + 5,
              ),
            ),
            buildWidth(5),
            SeatWidget(
              seat: Seat(
                seatType: SeatType.middle,
                index: index * 8 + 6,
              ),
            ),
            buildWidth(5),
            SeatWidget(
              seat: Seat(
                seatType: SeatType.lower,
                index: index * 8 + 7,
              ),
            ),
            buildWidth(50),
            SeatWidget(
              seat: Seat(
                seatType: SeatType.sideUpper,
                index: index * 8 + 8,
              ),
            ),
          ],
        ),
        buildHeight(10),
      ],
    );
  }
}

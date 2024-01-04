import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:train_seats/constants/color_constants.dart';
import 'package:train_seats/constants/common_constants.dart';
import 'package:train_seats/providers/providers.dart';
import 'package:train_seats/utils/seat.dart';

class SeatWidget extends ConsumerWidget {
  const SeatWidget({
    super.key,
    required this.seat,
  });

  final Seat seat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const double seatHeight = 60;

    double seatWidth = 60;

    final seatsList = ref.watch(seatsSelectedProvider);

    final searchedSeat = ref.watch(searchSeatProvider);

    return GestureDetector(
      //? StateNotifier Provider
      onTap: () {
        if (!ref.watch(seatsSelectedProvider).contains(seat.index)) {
          ref.read(seatsSelectedProvider.notifier).selectSeats(seat);
        } else {
          ref.read(seatsSelectedProvider.notifier).unselectSeats(seat);
        }
      },

      child: Container(
          height: seatHeight,
          width: seatWidth,
          decoration: BoxDecoration(
            color: seatsList.contains(seat.index)
                ? ColorConstants.selected
                : searchedSeat == seat.index
                    ? ColorConstants.searched
                    : ColorConstants.light,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextBuilder(seat: seat)),
    );
  }
}

class TextBuilder extends ConsumerWidget {
  const TextBuilder({
    super.key,
    required this.seat,
  });
  final Seat seat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isUp = seat.index % 8 == 1 ||
        seat.index % 8 == 2 ||
        seat.index % 8 == 3 ||
        seat.index % 8 == 4;

    List seatsSelected = ref.watch(seatsSelectedProvider);

    return isUp
        ? Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                seat.index.toString(),
                style: textStyling(
                  seatsSelected,
                  null,
                ),
              ),
              Text(
                seat.seatType.name.toUpperCase(),
                style: textStyling(
                  seatsSelected,
                  9,
                ),
              ),
              buildHeight(5),
            ],
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              buildHeight(5),
              Text(
                seat.seatType.name.toUpperCase(),
                style: textStyling(
                  seatsSelected,
                  9,
                ),
              ),
              Text(
                seat.index.toString(),
                style: textStyling(
                  seatsSelected,
                  null,
                ),
              ),
            ],
          );
  }

  TextStyle textStyling(
    List seatsSelected,
    double? fontSize,
  ) {
    return TextStyle(
      fontSize: fontSize,
      color: seatsSelected.contains(seat.index)
          ? ColorConstants.light
          : ColorConstants.dark,
    );
  }
}

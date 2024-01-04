import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:train_seats/constants/color_constants.dart';
import 'package:train_seats/constants/sized_box.dart';
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

    double seatWidth = seat.index % 8 == 4 || seat.index % 8 == 0 ? 80 : 60;

    return GestureDetector(
      //? State Provider
      onTap: () {
        if (!ref.watch(selectedSeats).contains(seat.index)) {
          ref.read(selectedSeats.notifier).update((state) => [
                ...state,
                seat.index,
              ]);
        } else {
          ref.read(selectedSeats.notifier).update((state) => [
                for (var index in state)
                  if (index != seat.index) index,
              ]);
        }
      },
      //? StateNotifier Provider
      // onTap: () {
      //   if (!ref.watch(seatsSelectedProvider).contains(seat.index)) {
      //     ref.read(seatsSelectedProvider.notifier).selectSeats(seat);
      //   } else {
      //     ref.read(seatsSelectedProvider.notifier).unselectSeats(seat);
      //   }
      // },

      child: Container(
          height: seatHeight,
          width: seatWidth,
          decoration: BoxDecoration(
            color: ref.read(selectedSeats).contains(seat.index)
                ? ColorConstants.dark
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

    List seatsSelected = ref.watch(selectedSeats);

    return isUp
        ? Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                seat.index.toString(),
                style: textColor(
                  seatsSelected,
                  null,
                ),
              ),
              Text(
                seat.seatType.name.toUpperCase(),
                style: textColor(
                  seatsSelected,
                  11,
                ),
              ),
              buildHeight(10),
            ],
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              buildHeight(10),
              Text(
                seat.seatType.name.toUpperCase(),
                style: textColor(
                  seatsSelected,
                  11,
                ),
              ),
              Text(
                seat.index.toString(),
                style: textColor(
                  seatsSelected,
                  null,
                ),
              ),
            ],
          );
  }

  TextStyle textColor(
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

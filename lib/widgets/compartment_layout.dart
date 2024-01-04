import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:train_seats/constants/color_constants.dart';
import 'package:train_seats/constants/sized_box.dart';
import 'package:train_seats/utils/seat.dart';
import 'package:train_seats/utils/seat_type.dart';
import 'package:train_seats/widgets/clippers.dart';
import 'package:train_seats/widgets/seat_widget.dart';

class CompartmentLayout extends ConsumerWidget {
  const CompartmentLayout({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<int> emergencySeats = [
      9,
      10,
      11,
      12,
      37,
      38,
      39,
      40,
    ];
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // upper side seats (+1 - +3)
            Stack(
              alignment: Alignment.topCenter,
              children: [
                SizedBox(
                  child: Row(
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
                    ],
                  ),
                ),
                ClipPath(
                  clipper: SeatClipper(),
                  child: Container(
                    height: 40,
                    width: 200,
                    decoration: BoxDecoration(
                      color: emergencySeats.contains(index * 8 + 3)
                          ? ColorConstants.emergency
                          : ColorConstants.dark,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            // side lower seats (+4)
            Stack(alignment: Alignment.topCenter, children: [
              SeatWidget(
                seat: Seat(
                  seatType: SeatType.sideLower,
                  index: index * 8 + 4,
                ),
              ),
              ClipPath(
                clipper: SeatClipper(),
                child: Container(
                  height: 40,
                  width: 70,
                  decoration: BoxDecoration(
                    color: emergencySeats.contains(index * 8 + 4)
                        ? ColorConstants.emergency
                        : ColorConstants.dark,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ]),
          ],
        ),
        buildHeight(50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // lower side seats (+5 - +7)
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  child: Row(
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
                    ],
                  ),
                ),
                Transform.flip(
                  flipY: true,
                  child: ClipPath(
                    clipper: SeatClipper(),
                    child: Container(
                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(
                        color: emergencySeats.contains(index * 8 + 7)
                            ? ColorConstants.emergency
                            : ColorConstants.dark,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            // side upper seat (+8)
            Stack(alignment: Alignment.bottomCenter, children: [
              SeatWidget(
                seat: Seat(
                  seatType: SeatType.sideUpper,
                  index: index * 8 + 8,
                ),
              ),
              Transform.flip(
                flipY: true,
                child: ClipPath(
                  clipper: SeatClipper(),
                  child: Container(
                    height: 40,
                    width: 70,
                    decoration: BoxDecoration(
                      color: emergencySeats.contains(index * 8 + 8)
                          ? ColorConstants.emergency
                          : ColorConstants.dark,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ]),
          ],
        ),
        buildHeight(10),
      ],
    );
  }
}

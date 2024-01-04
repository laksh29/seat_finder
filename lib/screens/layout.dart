import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:train_seats/constants/color_constants.dart';
import 'package:train_seats/constants/common_constants.dart';
import 'package:train_seats/providers/providers.dart';
import 'package:train_seats/widgets/compartment_layout.dart';

import '../utils/button_style.dart';
import '../widgets/example_seats.dart';

class SeatingLayoutFul extends ConsumerStatefulWidget {
  const SeatingLayoutFul({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SeatingLayoutFulState();
}

class _SeatingLayoutFulState extends ConsumerState<SeatingLayoutFul> {
  final TextEditingController textController = TextEditingController();

  final ItemScrollController scrollController = ItemScrollController();

  void scrollToIndex() {
    final int toJump = ref.watch(searchSeatProvider);
    var index = [0, 1, 2, 3, 4, 5, 6, 7, 8].contains(toJump)
        ? 0
        : [9, 10, 11, 12, 13, 14, 15, 16].contains(toJump)
            ? 1
            : [17, 18, 19, 20, 21, 22, 23, 24].contains(toJump)
                ? 2
                : [25, 26, 27, 28, 29, 30, 31, 32].contains(toJump)
                    ? 3
                    : [33, 34, 35, 36, 37, 38, 39, 40].contains(toJump)
                        ? 4
                        : 5;

    scrollController.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    super.dispose();
    textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Seat Finder"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 30,
        ),
        child: Column(
          children: [
            Row(
              children: [
                //* textField to find a seat
                Expanded(
                  child: TextFormField(
                    controller: textController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        suffixIcon: ref.watch(searchSeatProvider) != 0
                            ? IconButton(
                                onPressed: () {
                                  ref.read(searchSeatProvider.notifier).state =
                                      0;
                                  textController.clear();
                                },
                                icon: const Icon(Icons.close),
                              )
                            : null,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              width: 2,
                              color: Colors.blue,
                            ))),
                  ),
                ),
                buildWidth(20),
                //* find button
                ElevatedButton(
                  style: buttonStyle(),
                  onPressed: () {
                    final searchInt = int.parse(textController.text);
                    if (searchInt <= 48 && searchInt > 0) {
                      //? updating the provider to search for the seat
                      ref.read(searchSeatProvider.notifier).update(
                            (state) => searchInt,
                          );

                      //? call scrollToIndex method
                      scrollToIndex();
                    } else {
                      //? show snackBar
                      ScaffoldMessenger.of(context)
                          .showSnackBar(displaySnackbar(
                        "Please Enter a Seat Number that Exists!",
                      ));
                    }
                  },
                  child: const Text("Find"),
                )
              ],
            ),
            buildHeight(30),
            //* Example Seat Types - for reference
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ExampleSeats(
                  text: "Normal Seats",
                  color: ColorConstants.dark,
                  clipped: true,
                ),
                ExampleSeats(
                  text: "Emergency Seats",
                  color: ColorConstants.emergency,
                  clipped: true,
                ),
                ExampleSeats(
                  text: "Selected Seats",
                  color: ColorConstants.selected,
                ),
                ExampleSeats(
                  text: "Searched Seats",
                  color: ColorConstants.searched,
                ),
              ],
            ),
            buildHeight(30),
            //* list view of seats
            Expanded(
              child: ScrollablePositionedList.builder(
                  itemScrollController: scrollController,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return CompartmentLayout(
                      index: index,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

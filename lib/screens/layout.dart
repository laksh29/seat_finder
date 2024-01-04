import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:train_seats/constants/sized_box.dart';
import 'package:train_seats/providers/providers.dart';
import 'package:train_seats/widgets/compartment_layout.dart';

class SeatingLayout extends ConsumerWidget {
  const SeatingLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                Expanded(
                  child: TextFormField(
                    onChanged: (val) =>
                        ref.read(findController.notifier).update(
                              (state) => int.parse(val),
                            ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              width: 2,
                              color: Colors.blue,
                            ))),
                  ),
                ),
                buildWidth(20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      )),
                  onPressed: () {
                    int seatNo = ref.watch(findController);
                    ref.read(searchSeat.notifier).update((state) => seatNo);
                  },
                  child: const Text("Find"),
                )
              ],
            ),
            buildHeight(30),
            Expanded(
              child: ListView.builder(
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

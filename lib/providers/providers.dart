import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/seat.dart';

final searchSeatProvider = StateProvider<int>((ref) => 0);

final seatsSelectedProvider =
    StateNotifierProvider<SeatsSelected, List>((ref) => SeatsSelected());

class SeatsSelected extends StateNotifier<List> {
  SeatsSelected() : super([]);

  void selectSeats(Seat seat) {
    state = [...state, seat.index];
  }

  void unselectSeats(Seat seat) {
    state = [
      for (var index in state)
        if (index != seat.index) index,
    ];
  }
}

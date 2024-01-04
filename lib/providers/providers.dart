import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/seat.dart';

final findController = StateProvider<int>((ref) => 0);

final searchSeat = StateProvider<int>((ref) => 0);

final selectedSeats = StateProvider<List>((ref) => []);

final seatsSelectedProvider =
    StateNotifierProvider<SeatsSelected, List>((ref) => SeatsSelected());

class SeatsSelected extends StateNotifier<List> {
  SeatsSelected() : super([]);

  void selectSeats(Seat seat) {
    state.add(seat.index);
  }

  void unselectSeats(Seat seat) => state.remove(seat.index);
}

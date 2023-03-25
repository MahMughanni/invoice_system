import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../screens/invoice_flow/create_invoice.dart';

part 'add_fixed_item_state.dart';

class AddFixedItemCubit extends Cubit<AddFixedItemState> {
  AddFixedItemCubit()
      : super(
          AddFixedItemState(counter: 0, items: []),
        );

  void increment() {
    emit(
      AddFixedItemState(
        counter: state.counter++,
        items: List.from(state.items)
          ..add(
            ContentToAddService(),
          ),
      ),
    );
  }

  void delete(int index) {
    emit(
      AddFixedItemState(
        counter: state.counter--,
        items: List.from(state.items)..removeAt(index),
      ),
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/fixed_entities.dart';
import '../../../domain/entities/service_entities/service_entities.dart';
import '../../screens/invoice_flow/create_invoice.dart';

part 'add_fixed_item_state.dart';

class AddFixedItemCubit extends Cubit<AddFixedItemState> {
  AddFixedItemCubit()
      : super(
          AddFixedItemState(counter: 0, items: []),
        );

  // void addItem(FixedItem fixedItem) {
  //   // Add new item to the existing list of items
  //   final updatedItemsList = [...state.items.toList(), fixedItem];
  //   emit(updatedItemsList);
  // }

  void increment() {
    emit(
      AddFixedItemState(
        counter: state.counter++,
        items: List.from(state.items)
          ..add(
            ContentToAddService() ,
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

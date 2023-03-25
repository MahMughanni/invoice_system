import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice_system/core/services/services_locator.dart';
import 'package:invoice_system/presentation/controller/invoice_bloc/invoice_bloc.dart';
import 'package:invoice_system/presentation/controller/localData/shared_perf.dart';
import 'package:invoice_system/presentation/screens/widget/SearchBar.dart';
import 'package:invoice_system/presentation/screens/widget/bottom_sheet/ContentSheetStatus.dart';
import 'package:invoice_system/presentation/screens/widget/bottom_sheet/CustomBottomSheetInvoiceFilter.dart';
import 'package:invoice_system/utils/appConst.dart';

import '../../../domain/entities/fixed_entities.dart';
import '../../../utils/helper.dart';

class InvoiceInTabScreen extends StatelessWidget {
  const InvoiceInTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<InvoiceBloc>()
        ..add(GetInvoiceEvent(SharedPrefController().getUser().accessToken)),
      child: ListView(
        shrinkWrap: true,
        children: [
          SearchBar(
            onPressed: () {
              showModalBottomSheet(
                shape: const OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    borderSide: BorderSide.none),
                backgroundColor: Colors.white,
                context: context,
                isScrollControlled: true,
                builder: (context) => const SizedBox(
                  child: CustomBottomSheetInvoiceFilter(),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          Container(
            margin:
                const EdgeInsets.symmetric(vertical: AppSizes.paddingVertival),
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: const Color(AppColor.white),
              borderRadius: BorderRadius.circular(7),
            ),
            child: InvoiceListBody(),
          )
        ],
      ),
    );
  }
}

class InvoiceListBody extends StatelessWidget {
  const InvoiceListBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InvoiceBloc, InvoiceSeccsuesState>(
      builder: (context, state) {
        var data = state.invoiceList;
        return ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: data.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            // print(data[index].status);
            String title = data[index].fixed.first.itemName ?? '';

            return ListTile(
                onTap: () {
                  showModalBottomSheet(
                    shape: const OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        borderSide: BorderSide.none),
                    backgroundColor: Colors.white,
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => SizedBox(
                      child: ContentSheetStatus(
                        id: data[index].id,
                        status: data[index].status.toString(),
                        time: Helper.formatTime(data[index].createdAt),
                        title: data[index].fixed.first.itemName.toString(),
                        subTitle:
                            data[index].fixed.first.description.toString(),
                        subTotal: data[index].subTotal.toString(),
                      ),
                    ),
                  );
                },
                leading: Column(
                  //  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text(
                        title,
                        maxLines: 1,
                        softWrap: false,
                        overflow: TextOverflow.fade,
                        style:
                            const TextStyle(fontSize: AppSizes.textDefaultSize),
                      ),
                    ),
                    SizedBox(
                      child: Text(
                        maxLines: 1,
                        softWrap: false,
                        overflow: TextOverflow.fade,
                        data[index].client.firstName,
                        style: const TextStyle(
                            color: Colors.black, fontSize: AppSizes.textTiny),
                      ),
                    ),
                  ],
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$${data[index].subTotal.toString()}',
                      maxLines: 1,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      data[index].status.toString(),
                      style: TextStyle(
                        color: Helper.setColor(data[index].status),
                      ),
                    )
                  ],
                ),
                subtitle: Text(
                  maxLines: 1,
                  softWrap: false,
                  overflow: TextOverflow.fade,
                  Helper.formatTime(data[index].createdAt.toString()),
                  style: const TextStyle(fontSize: AppSizes.textVeryTiny),
                ));
          },
        );
      },
    );
  }
}

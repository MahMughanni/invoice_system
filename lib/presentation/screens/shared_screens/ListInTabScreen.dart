import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice_system/core/services/services_locator.dart';
import 'package:invoice_system/presentation/controller/service_bloc/service_bloc.dart';
import 'package:invoice_system/presentation/screens/widget/SearchBar.dart';
import 'package:invoice_system/presentation/screens/widget/bottom_sheet/CustomSheetListFilter.dart';
import 'package:invoice_system/utils/appConst.dart';

import '../../../utils/helper.dart';
import '../widget/bottom_sheet/ContentSheetStatus.dart';

class ListInTabScreen extends StatelessWidget {
  const ListInTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => getIt<ServiceBloc>()..add(GetServiceEvent()),
      child: ListView(
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
                  child: CustomSheetListFilter(),
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
            child: const ServiceListBody(),
          )
        ],
      ),
    );
  }
}

class ServiceListBody extends StatelessWidget {
  const ServiceListBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServiceBloc, ServiceInitialState>(
      builder: (context, state) {
        var data = state.serviceList;
        // print(data.length);
        return ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.serviceList.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              var fixedData = data[index].fixed;
              var itemName = data[index]
                  .fixed
                  .map((e) => e.itemName.toString())
                  .toString();

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
                        status: data[index].status,
                        time: data[index].createdAt,
                        title: data[index].fixed.first.itemName,
                        subTitle: data[index].fixed.first.description,
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
                      width: 200,
                      child: Text(
                        index == 0
                            ? fixedData.first.itemName.isEmpty
                                ? 'Nothing '
                                : fixedData.first.itemName
                            : '',
                        style:
                            const TextStyle(fontSize: AppSizes.textDefaultSize),
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: Text(
                        fixedData.first.description.toString().isEmpty
                            ? 'dd'
                            : fixedData.first.description.toString(),
                        style: const TextStyle(
                            color: Color(AppColor.gray),
                            fontSize: AppSizes.textTiny),
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ],
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(fixedData.first.price.toString().isEmpty
                        ? '0.0'
                        : fixedData.first.price.toString()),
                    Text(data[index].status.toString() ?? [].toString(),
                        style: TextStyle(
                            color: Helper.setColor(data[index].status))),
                  ],
                ),
              );
            });
      },
    );
  }
}

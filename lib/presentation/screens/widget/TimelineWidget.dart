import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../domain/entities/invoice_details_entities.dart';
import '../../../utils/appConst.dart';
import 'mainCont.dart';

class TimelineWidget extends StatelessWidget {
  const TimelineWidget({
    Key? key,
    required this.history,
  }) : super(key: key);

  final List<HistoryEntities> history;

  @override
  Widget build(BuildContext context) {
    List timelineStatRight = [];
    List timelineStatLeft = [];
    var height = MediaQuery.of(context).size.height;
    return MainContainer(
      height: height * .25,
      width: double.infinity,
      paddingTop: 15,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              StringManger.timeline,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            Expanded(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: timelineStatRight.length,
                itemBuilder: (BuildContext context, int index) {
                  timelineStatLeft = [
                    history[index].createdAt.toString(),
                    history[index].updatedAt.toString(),
                  ];
                  timelineStatLeft = [
                    history[index].action,
                    history[index].status,
                  ];
                  return TimelineTile(
                    alignment: TimelineAlign.manual,
                    lineXY: .3,
                    isFirst: index == 0,
                    indicatorStyle: const IndicatorStyle(
                      indicatorXY: .5,
                      width: 8,
                      color: AppColor.primaryColor,
                    ),
                    endChild: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(timelineStatRight[index].toString()),
                    ),
                    startChild: Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(timelineStatLeft[index]),
                        ],
                      ),
                    ),
                    beforeLineStyle: const LineStyle(
                      color: AppColor.primaryColor,
                      thickness: 1,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

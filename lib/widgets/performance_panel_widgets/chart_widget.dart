import 'package:abwaab_practice/blox/responsiveness_cubit/responsiveness_cubit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_texts.dart';

class ChartWidget extends StatefulWidget {
  const ChartWidget({required this.selectedIndex, super.key});
  final int selectedIndex;

  @override
  State<ChartWidget> createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  double dxSwiping = 0.0;
  LineChartBarData avgData = LineChartBarData(
    color: AppColors.purple400,
    showingIndicators: [0],
    dotData: FlDotData(
      getDotPainter: (spot, value, lineData, index) {
        return FlDotCirclePainter(
          color: AppColors.purple400,
        );
      },
    ),
    spots: [FlSpot(4, 87), FlSpot(3, 59), FlSpot(2, 78), FlSpot(1, 61)],
  );
  LineChartBarData solvedQuestionsData = LineChartBarData(
    color: AppColors.blue400,
    spots: [FlSpot(4, 30), FlSpot(3, 25), FlSpot(2, 25), FlSpot(1, 18)],
  );
  LineChartBarData aqData = LineChartBarData(
    color: AppColors.green400,
    spots: [FlSpot(4, 12), FlSpot(3, 18), FlSpot(2, 17), FlSpot(1, 12)],
  );
  LineChartBarData wrongAnswersData = LineChartBarData(
    color: AppColors.red400,
    spots: [FlSpot(4, 9), FlSpot(3, 15), FlSpot(2, 12), FlSpot(1, 25)],
  );
  double minX = 0;
  double maxX = 5;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResponsivenessCubit, ResponsivenessState>(
      builder: (context, state) {
        return Container(
          height: 340,

          // color: Colors.black,
          padding: EdgeInsets.symmetric(
            horizontal:
                state.screenType == ScreenType.miniTablet || state.screenType == ScreenType.mobile
                    ? 20
                    : 27,
          ),
          child: Stack(
            children: [
              LineChart(
                LineChartData(
                  clipData: FlClipData.all(),
                  minX: minX,
                  maxX: state.screenType == ScreenType.mobile ||
                          state.screenType == ScreenType.miniTablet
                      ? 2
                      : maxX,
                  minY: 0,
                  maxY: 100,
                  gridData: FlGridData(
                    horizontalInterval: 15,
                    verticalInterval: 0.75,
                    getDrawingVerticalLine: (value) => const FlLine(
                      color: AppColors.slate300,
                      strokeWidth: 0.5,
                      dashArray: [5],
                    ),
                    getDrawingHorizontalLine: (value) => const FlLine(
                      color: AppColors.slate300,
                      strokeWidth: 0.5,
                      dashArray: [5],
                    ),
                  ),
                  titlesData: FlTitlesData(
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        interval: 20,
                        getTitlesWidget: (value, meta) {
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            child: AppTexts.bodyRegular(
                              text: value.toInt().toString(),
                              fontSize: state.screenType == ScreenType.mobile ? 12 : 14,
                              fontColor: AppColors.slate500,
                            ),
                          );
                        },
                      ),
                    ),
                    leftTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      axisNameSize: 20,
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        interval: 1,
                        getTitlesWidget: (value, meta) {
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            child: AppTexts.bodyRegular(
                              text: 'الاسبوع ${value + 1}',
                              fontSize: state.screenType == ScreenType.mobile ? 12 : 14,
                              fontColor: AppColors.slate500,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  lineBarsData: [
                    if (widget.selectedIndex == 0)
                      avgData
                    else if (widget.selectedIndex == 1)
                      solvedQuestionsData
                    else if (widget.selectedIndex == 2)
                      aqData
                    else
                      wrongAnswersData
                  ],
                  borderData: FlBorderData(
                    border: const Border(
                      right: BorderSide(
                        width: 1,
                        color: AppColors.slate400,
                      ),
                      bottom: BorderSide(
                        width: 1,
                        color: AppColors.slate400,
                      ),
                    ),
                  ),
                  lineTouchData: LineTouchData(
                    touchCallback: (event, response) {
                      if (event is FlPanUpdateEvent) {
                        dxSwiping = event.details.delta.dx;
                      }
                      if (event is FlPanEndEvent) {
                        if (state.screenType == ScreenType.mobile ||
                            state.screenType == ScreenType.miniTablet) {
                          if (dxSwiping > 0) {
                            if (minX - 3 < 0) {
                              return;
                            }
                            setState(() {
                              minX = minX - 3;
                              maxX -= 3;
                            });
                          } else {
                            setState(() {
                              minX = maxX;
                              maxX += 3;
                            });
                          }
                        } else {
                          if (dxSwiping > 0) {
                            if (minX - 5 < 0) {
                              return;
                            }
                            setState(() {
                              minX = minX - 5;
                              maxX -= 5;
                            });
                          } else {
                            setState(() {
                              minX = maxX;
                              maxX += 5;
                            });
                          }
                        }
                      }
                    },
                    getTouchedSpotIndicator: (lineData, spotIndexes) {
                      return spotIndexes.map(
                        (index) {
                          return TouchedSpotIndicatorData(
                            const FlLine(
                              color: AppColors.slate300,
                              strokeWidth: 0.5,
                            ),
                            FlDotData(
                              getDotPainter: (spot, value, lineData, index) {
                                if (widget.selectedIndex == 0) {
                                  return FlDotCirclePainter(
                                    color: AppColors.purple400,
                                    strokeWidth: 8,
                                    radius: 5,
                                    strokeColor: AppColors.purple100,
                                  );
                                } else if (widget.selectedIndex == 1) {
                                  return FlDotCirclePainter(
                                    color: AppColors.blue400,
                                    strokeWidth: 8,
                                    radius: 5,
                                    strokeColor: AppColors.blue50,
                                  );
                                } else if (widget.selectedIndex == 2) {
                                  return FlDotCirclePainter(
                                    color: AppColors.green400,
                                    strokeWidth: 8,
                                    radius: 5,
                                    strokeColor: AppColors.green50,
                                  );
                                } else {
                                  return FlDotCirclePainter(
                                    color: AppColors.red400,
                                    strokeWidth: 8,
                                    radius: 5,
                                    strokeColor: AppColors.red50,
                                  );
                                }
                              },
                            ),
                          );
                        },
                      ).toList();
                    },
                    touchTooltipData: LineTouchTooltipData(
                      maxContentWidth: 10.84.w,
                      tooltipRoundedRadius: 8,
                      getTooltipColor: (spot) {
                        if (widget.selectedIndex == 0) {
                          return AppColors.purple50;
                        } else if (widget.selectedIndex == 1) {
                          return AppColors.blue50;
                        } else if (widget.selectedIndex == 2) {
                          return AppColors.green50;
                        } else {
                          return AppColors.red50;
                        }
                      },
                      getTooltipItems: (spots) {
                        return spots.map(
                          (spot) {
                            return LineTooltipItem(
                              '',
                              textAlign: TextAlign.end,
                              TextStyle(
                                fontSize: 16,
                              ),
                              children: [
                                TextSpan(
                                  text: 'المعدل: ',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.slate500,
                                  ),
                                ),
                                TextSpan(
                                  text: '%${spot.y}\n',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: 'عدد الاسئلة المحلولة: ',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.slate500,
                                  ),
                                ),
                                TextSpan(
                                  text: '30',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            );
                          },
                        ).toList();
                      },
                    ),
                    handleBuiltInTouches: true,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                bottom: 41,
                right: 41,
                child: Container(
                  width: state.screenType == ScreenType.mobile ? 42 : 62,
                  padding: EdgeInsets.only(
                    top: 12,
                    right: 14,
                  ),
                  decoration: BoxDecoration(
                    // color: Colors.transparent,
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFE4ECFF).withOpacity(0.5),
                        Colors.white.withOpacity(0.3),
                      ],
                      stops: [0.05, 0.3],
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'images/drag.svg',
                        width: state.screenType == ScreenType.mobile ? 20 : 29,
                        height: 32,
                      ),
                      AppTexts.bodyRegular(
                        text: 'اسحب',
                        fontColor: AppColors.slate500,
                        fontSize: state.screenType == ScreenType.mobile ? 10 : 14,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
// SfCartesianChart(
//   plotAreaBorderColor: Colors.transparent,
//   selectionType: SelectionType.point,
//   selectionGesture: ActivationMode.longPress,
//   plotAreaBorderWidth: 0.5,
//   enableSideBySideSeriesPlacement: false,
//   tooltipBehavior: TooltipBehavior(
//     activationMode: ActivationMode.longPress,
//     enable: true,
//     duration: 500,
//     shadowColor: Colors.black.withOpacity(0.2),
//     textAlignment: ChartAlignment.center,
//     elevation: 10,
//     header: '',
//     format: 'point.y%',
//     canShowMarker: false,
//     textStyle: const TextStyle(
//       color: AppColors.slate900,
//       fontSize: 18,
//     ),
//     color: Colors.white,
//   ),
//   primaryXAxis: const CategoryAxis(
//     labelAlignment: LabelAlignment.start,
//
//     // maximumLabels: 5,
//     // initialVisibleMaximum: 5,
//     majorGridLines: MajorGridLines(
//       width: 0.5,
//       dashArray: [5, 5],
//       color: AppColors.slate300,
//     ),
//     // crossesAt: 0,
//     majorTickLines: MajorTickLines(
//       size: 0,
//     ),
//     // maximum: 5,
//     // labelsExtent: 3,
//     labelPlacement: LabelPlacement.onTicks,
//     tickPosition: TickPosition.inside,
//     labelStyle: TextStyle(
//       color: AppColors.slate500,
//       fontSize: 14,
//     ),
//     axisLine: AxisLine(
//       color: AppColors.slate400,
//     ),
//   ),
//   primaryYAxis: const NumericAxis(
//     minimum: 0,
//     maximum: 100,
//     minorTicksPerInterval: 0,
//     majorTickLines: MajorTickLines(
//       size: 0,
//     ),
//     // majorTickLines: MajorTickLines(
//     //   size: 1,
//     // ),
//     // initialZoomFactor: 2,
//     // initialVisibleMaximum: 5,
//     majorGridLines: MajorGridLines(
//       width: 0.5,
//       dashArray: [5],
//       color: AppColors.slate300,
//     ),
//     tickPosition: TickPosition.inside,
//     opposedPosition: true,
//     labelStyle: TextStyle(
//       color: AppColors.slate500,
//       fontSize: 14,
//     ),
//     interval: 20,
//     axisLine: AxisLine(
//       color: AppColors.slate400,
//     ),
//   ),
//   series: [
//     LineSeries(
//       color: AppColors.purple400,
//       width: 1,
//       dataSource: avgData,
//       onRendererCreated: (ChartSeriesController controller) {
//         avgController = controller;
//       },
//       xValueMapper: (data, _) {
//         return data.week;
//       },
//       yValueMapper: (data, _) => data.avg,
//       selectionBehavior: SelectionBehavior(
//         enable: true,
//         toggleSelection: true,
//         // selectedBorderWidth: 4,
//         selectedColor: AppColors.purple50,
//         // unselectedColor: AppColors.purple400,
//       ),
//       markerSettings: MarkerSettings(
//         isVisible: true,
//         color: AppColors.purple400,
//         // borderColor: AppColors.purple50,
//         // borderWidth: 5,
//         height: 11,
//         width: 11,
//         // shape: DataMarkerType.diamond,
//       ),
//       // dataLabelSettings: DataLabelSettings(isVisible: true),
//     ),
//     LineSeries(
//       color: AppColors.blue400,
//       width: 1,
//       dataSource: <PerformanceData>[
//         PerformanceData(
//           'الأسبوع 5',
//           null,
//         ),
//         PerformanceData(
//           'الأسبوع 4',
//           36,
//         ),
//         PerformanceData(
//           'الأسبوع 3',
//           30,
//         ),
//         PerformanceData(
//           'الأسبوع 2',
//           30,
//         ),
//         PerformanceData(
//           'الأسبوع 1',
//           18,
//         ),
//       ],
//       xValueMapper: (data, _) {
//         return data.week;
//       },
//       enableTooltip: true,
//       yValueMapper: (data, _) => data.avg,
//       markerSettings: MarkerSettings(
//         isVisible: true,
//         color: AppColors.blue400,
//         borderColor: AppColors.blue50,
//         borderWidth: 5,
//         height: 14,
//         width: 14,
//       ),
//       // dataLabelSettings: DataLabelSettings(isVisible: true),
//     ),
//     LineSeries(
//       color: AppColors.green400,
//       width: 1,
//       dataSource: <PerformanceData>[
//         PerformanceData(
//           'الأسبوع 5',
//           null,
//         ),
//         PerformanceData(
//           'الأسبوع 4',
//           12,
//         ),
//         PerformanceData(
//           'الأسبوع 3',
//           18,
//         ),
//         PerformanceData(
//           'الأسبوع 2',
//           17,
//         ),
//         PerformanceData(
//           'الأسبوع 1',
//           12,
//         ),
//       ],
//       xValueMapper: (data, _) {
//         return data.week;
//       },
//       yValueMapper: (data, _) => data.avg,
//       markerSettings: MarkerSettings(
//         isVisible: true,
//         borderWidth: 5,
//         height: 14,
//         width: 14,
//         borderColor: AppColors.green50,
//         color: AppColors.green400,
//       ),
//       // dataLabelSettings: DataLabelSettings(isVisible: true),
//     ),
//     LineSeries(
//       color: AppColors.red400,
//       width: 1,
//       dataSource: <PerformanceData>[
//         PerformanceData(
//           'الأسبوع 5',
//           null,
//         ),
//         PerformanceData(
//           'الأسبوع 4',
//           9,
//         ),
//         PerformanceData(
//           'الأسبوع 3',
//           12,
//         ),
//         PerformanceData(
//           'الأسبوع 2',
//           10,
//         ),
//         PerformanceData(
//           'الأسبوع 1',
//           25,
//         ),
//       ],
//       xValueMapper: (data, _) {
//         return data.week;
//       },
//       yValueMapper: (data, _) => data.avg,
//       markerSettings: MarkerSettings(
//         isVisible: true,
//         color: AppColors.red400,
//         borderColor: AppColors.red50,
//         borderWidth: 5,
//         height: 14,
//         width: 14,
//       ),
//       // dataLabelSettings: DataLabelSettings(isVisible: true),
//     ),
//   ],
//   onPlotAreaSwipe: (direction) {
//     if (direction == ChartSwipeDirection.start) {
//       setState(() {
//         avgData.add(
//           PerformanceData(
//             'الاسبوع 6',
//             50,
//           ),
//         );
//
//         if (avgController != null) {
//           avgController!
//               .updateDataSource(addedDataIndexes: <int>[avgData.length - 1]);
//         }
//       });
//     } else {
//       setState(() {
//         avgData.removeWhere((data) => data.week == 'الاسبوع 6');
//         if (avgController != null) {
//           avgController!
//               .updateDataSource(removedDataIndexes: <int>[avgData.length - 1]);
//         }
//       });
//     }
//   },
// ),

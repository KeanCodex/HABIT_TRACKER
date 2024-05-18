import 'package:codex_app/Components/LabelStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:intl/intl.dart';

import '../Customs/Customized_widget.dart';
import '../Models/DateTime.dart';

class MonthlySummary extends StatelessWidget {
  final Map<DateTime, int>? datasets;
  final String startDate;

  const MonthlySummary({
    super.key,
    required this.datasets,
    required this.startDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: LabelText(
              label: 'BOARD PROGRESS',
              fontsize: 15,
              letterSpacing: 3,
              fontweight: FontWeight.w500,
              colors: dblueBG,
            ),
          ),
          const Divider(),
          HeatMap(
            startDate: createDateTimeObject(startDate),
            endDate: DateTime.now().add(const Duration(days: 0)),
            datasets: datasets,
            colorMode: ColorMode.color,
            defaultColor: lightbrBG,
            textColor: dblueBG,
            showColorTip: false,
            showText: true,
            fontSize: 10,
            scrollable: true,
            size: 30,
            colorsets: const {
              1: Color.fromARGB(20, 2, 179, 8),
              2: Color.fromARGB(40, 2, 179, 8),
              3: Color.fromARGB(60, 2, 179, 8),
              4: Color.fromARGB(80, 2, 179, 8),
              5: Color.fromARGB(100, 2, 179, 8),
              6: Color.fromARGB(120, 2, 179, 8),
              7: Color.fromARGB(150, 2, 179, 8),
              8: Color.fromARGB(180, 2, 179, 8),
              9: Color.fromARGB(220, 2, 179, 8),
              10: Color.fromARGB(255, 2, 179, 8),
            },
            onClick: (value) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  backgroundColor: Colors.blueGrey,
                  content: LabelText(
                      fontsize: 16,
                      textAlign: TextAlign.center,
                      label:
                          'Date: ${DateFormat.yMMMd().format(value).toString()}')));
            },
          ),
        ],
      ),
    );
  }
}

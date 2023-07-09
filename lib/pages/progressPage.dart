// ignore: file_names
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

final _formKey = GlobalKey<FormState>(); // global form key

TextEditingController conBerat = TextEditingController();
TextEditingController conHari = TextEditingController();

int? beratBadan = 0;
int? hariKe = 0;

void addData(String berat, String hari) {
  beratBadan = int.parse(berat);
  hariKe = int.parse(hari);
}

final List<ChartData> chartData = [
  // ChartData(1, 50),
  // ChartData(2, 20),
  // ChartData(3, 43),
  // ChartData(4, 55),
  // ChartData(5, 60),
  // ChartData(6, 65),
  // ChartData(7, 60),
];

ChartSeriesController? _chartSeriesController;

class _ProgressPageState extends State<ProgressPage> {
  //Initialize the series controller
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Progres Anda : ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              IconButton(
                  onPressed: () {
                    ShowFormDialog(context);
                  },
                  icon: const Icon(Icons.add))
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          SfCartesianChart(series: <ChartSeries>[
            // Renders line chart
            LineSeries<ChartData, int>(
                dataSource: chartData,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y)
          ]),
        ],
      ),
    )));
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final int x;
  final int y;
}

// ignore: non_constant_identifier_names
Future<void> ShowFormDialog(context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: conBerat,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ], // Only numbers can be entered

                    decoration: const InputDecoration(
                      labelText: 'Berat Badan (kg)',
                    ),
                  ),
                  TextFormField(
                    controller: conHari,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ], // Only numbers can be entered

                    decoration: const InputDecoration(
                      labelText: 'Hari ke : ',
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
                child: const Text("Simpan"),
                onPressed: () {
                  // ignore: list_remove_unrelated_type
                  addData(conBerat.text, conHari.text);
                  if (chartData.isEmpty) {
                    chartData.add(ChartData(hariKe!, beratBadan!));
                    _chartSeriesController?.updateDataSource(
                      addedDataIndexes: <int>[hariKe!],
                      removedDataIndexes: <int>[hariKe!],
                    );
                    // ignore: iterable_contains_unrelated_type
                  } else if (chartData
                          .indexWhere((element) => element.x == hariKe) ==
                      hariKe) {
                    chartData.removeWhere((item) => item.x == hariKe);
                    chartData.add(ChartData(hariKe!, beratBadan!));
                    _chartSeriesController?.updateDataSource(
                      removedDataIndexes: <int>[hariKe!],
                      updatedDataIndexes: <int>[hariKe!],
                    );
                  } else {
                    // chartData.removeAt(hariKe!);
                    chartData.add(ChartData(hariKe!, beratBadan!));
                    _chartSeriesController?.updateDataSource(
                      // removedDataIndexes: <int>[hariKe!],
                      addedDataIndexes: <int>[hariKe!],
                    );
                  }
                  Navigator.pop(context);
                }),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  conBerat.text = '';
                  conHari.text = '';
                },
                child: const Text("Batal"))
          ],
        );
      });
}

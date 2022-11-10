import 'package:flutter/material.dart';
import 'package:score_stroke_siriraj/input_condition.dart';

class StrokeScorePage extends StatefulWidget {
  const StrokeScorePage({Key? key}) : super(key: key);

  @override
  State<StrokeScorePage> createState() => _StrokeScorePageState();
}

class _StrokeScorePageState extends State<StrokeScorePage> {
  final diastoleController = TextEditingController();
  String result = "";

  InputCondition? selectedKesadaran;
  final listKesadaran = <InputCondition>[
    InputCondition(value: 0, label: 'Compos Mentis'),
    InputCondition(value: 1, label: 'Somnolen'),
    InputCondition(value: 2, label: 'Semi Koma / Koma'),
  ];

  InputCondition? selectedMuntah;
  final listMuntah = <InputCondition>[
    InputCondition(value: 0, label: 'Tidak'),
    InputCondition(value: 1, label: 'Ya'),
  ];

  InputCondition? selectedNyeriKepala;
  final listNyeriKepala = <InputCondition>[
    InputCondition(value: 0, label: 'Tidak'),
    InputCondition(value: 1, label: 'Ya'),
  ];

  InputCondition? selectedAntheroma;
  final listAntheroma = <InputCondition>[
    InputCondition(value: 0, label: 'Tidak'),
    InputCondition(value: 1, label: 'Satu atau Lebih'),
  ];

  void checkSkorStroke() {
    double diastole = double.parse(diastoleController.text);
    double sss = (2.5 * selectedKesadaran!.value) + (2 * selectedMuntah!.value) + (2 * selectedNyeriKepala!.value) + (diastole * 0.1) - (selectedAntheroma!.value * 3) - 12;
    if (sss > 1) {
      setState(() {
        result = "Stroke hemorrhagic";
      });

    }
    if (sss <-1) {
      setState(() {
        result = "Stroke non-hemorrhagic";
      });
    }
    if (sss >= 1 && sss <=1) {
      setState(() {
        result = "borderline";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skor Stroke Siriraj (SSS)'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Kesadaran',
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      DropdownButton<InputCondition>(
                        isExpanded: true,
                        value: selectedKesadaran,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (InputCondition? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            selectedKesadaran = value!;
                          });
                        },
                        items: listKesadaran
                            .map<DropdownMenuItem<InputCondition>>((InputCondition value) {
                          return DropdownMenuItem<InputCondition>(
                            value: value,
                            child: Text(value.label),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 16,),
                      const Text(
                        'Muntah',
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      DropdownButton<InputCondition>(
                        isExpanded: true,
                        value: selectedMuntah,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (InputCondition? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            selectedMuntah = value!;
                          });
                        },
                        items: listMuntah
                            .map<DropdownMenuItem<InputCondition>>((InputCondition value) {
                          return DropdownMenuItem<InputCondition>(
                            value: value,
                            child: Text(value.label),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 16,),
                      const Text(
                        'Nyeri Kepala',
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      DropdownButton<InputCondition>(
                        isExpanded: true,
                        value: selectedNyeriKepala,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (InputCondition? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            selectedNyeriKepala = value!;
                          });
                        },
                        items: listNyeriKepala
                            .map<DropdownMenuItem<InputCondition>>((InputCondition value) {
                          return DropdownMenuItem<InputCondition>(
                            value: value,
                            child: Text(value.label),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 16,),
                      const Text(
                        'Atheroma',
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      const Text('\u2022 Diabetes Melitus'),
                      const Text('\u2022 Angina pectoris'),
                      const Text('\u2022 Claudication intermittent'),
                      DropdownButton<InputCondition>(
                        isExpanded: true,
                        value: selectedAntheroma,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (InputCondition? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            selectedAntheroma = value!;
                          });
                        },
                        items: listAntheroma
                            .map<DropdownMenuItem<InputCondition>>((InputCondition value) {
                          return DropdownMenuItem<InputCondition>(
                            value: value,
                            child: Text(value.label),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 16,),
                      const Text(
                        'Diastole',
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      TextField(
                        controller: diastoleController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurpleAccent),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurpleAccent),
                          ),
                        ),
                      ),
                      const SizedBox(height: 50,),
                      if (result != "")
                        Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            decoration: const BoxDecoration(
                                color: Colors.greenAccent
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'hasil check:',
                                  style: TextStyle(
                                      fontSize: 12
                                  ),
                                ),
                                Text(
                                  result,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            )
                        )
                    ],
                  ),
                )
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  // primary: Colors.black,
                  minimumSize: const Size.fromHeight(50), // NEW
                ),
                onPressed: () {
                  if (selectedMuntah == null || selectedNyeriKepala == null || selectedKesadaran == null || selectedAntheroma == null || diastoleController.text.isEmpty) {
                    const snackBar = SnackBar(
                      content: Text('Pastikan untuk mengisi semua kriteria'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    return;
                  }
                  checkSkorStroke();
                },
                child: const Text('check')
            )
          ],
        )
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_corrency_converter/pages/corency_converter_material_page.dart';

class MyCupertinoApp extends StatelessWidget {
  const MyCupertinoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: CorrencyConverterCupertino(),
    );
  }
}

class CorrencyConverterCupertino extends StatefulWidget {
  const CorrencyConverterCupertino({super.key});

  @override
  State<CorrencyConverterCupertino> createState() =>
      _CorrencyConverterCupertinoState();
}

class _CorrencyConverterCupertinoState
    extends State<CorrencyConverterCupertino> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          "Corrency converter app",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Color(0x88222222),
          ),
        ),
        backgroundColor: Color(0xFFFAFAFA),
      ),
      child: Column(
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "BDT ${result != 0 ? result.toStringAsFixed(2) : 0}",
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF889999),
                  ),
                ),
                CupertinoTextField(
                  placeholder: 'Enter amount',
                  placeholderStyle:
                      const TextStyle(color: CupertinoColors.inactiveGray),
                  controller: textEditingController,
                  prefix: const Icon(
                    CupertinoIcons.money_dollar_circle_fill,
                    color: CupertinoColors.inactiveGray,
                  ),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: CupertinoColors.black,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD8D8D8),
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  // InputDecoration(
                  //   labelStyle: TextStyle(color: Color(0xFF999999)),
                  //   prefixIcon: Icon(Icons.monetization_on_sharp),
                  //   filled: true,
                  //   enabledBorder: border,
                  //   focusedBorder: border,
                  // ),
                ),
                const SizedBox(height: 10),
                CupertinoButton(
                  color: const Color(0xDDD5D5D5),
                  minSize: 50,
                  onPressed: () {
                    setState(() {
                      result = double.parse(textEditingController.text) * 104;
                    });
                  },
                  child: const Text('convert'),
                ),
              ],
            ),
          ),
          const Spacer(),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const MyApp()));
              },
              child: const Text('See material Design'))
        ],
      ),
    );
  }
}

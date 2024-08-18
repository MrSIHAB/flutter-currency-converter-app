import 'package:flutter/material.dart';
import 'package:flutter_corrency_converter/pages/corrency_converter_cupertino_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CorencyConverterMaterialPage(),
    );
  }
}

class CorencyConverterMaterialPage extends StatefulWidget {
  const CorencyConverterMaterialPage({super.key});

  @override
  State createState() => _CorrencyConverterMaterialState();
}

class _CorrencyConverterMaterialState extends State {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
//  ==============================================================
    /* Border definations */
    const border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(
        color: Color(0xFFA0A0A0),
        width: 0.5,
        strokeAlign: BorderSide.strokeAlignInside,
      ),
    );

//  ==============================================================
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      appBar: AppBar(
        title: const Text(
          "Corrency converter app",
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        backgroundColor: const Color(0xFFFAFAFA),
        elevation: 0,
        centerTitle: true,
        actions: const [Icon(Icons.menu)],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "BDT ${result != 0 ? result.toStringAsFixed(2) : 0}",
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF889999),
                ),
              ),
              TextField(
                controller: textEditingController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                style: const TextStyle(fontWeight: FontWeight.w600),
                decoration: const InputDecoration(
                  labelText: 'Enter amount',
                  labelStyle: TextStyle(color: Color(0xFF999999)),
                  prefixIcon: Icon(Icons.monetization_on_sharp),
                  filled: true,
                  fillColor: Color(0xFFD8D8D8),
                  border: InputBorder.none,
                  enabledBorder: border,
                  focusedBorder: border,
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  setState(() {
                    result = double.parse(textEditingController.text) * 104;
                  });
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xDDD5D5D5),
                  foregroundColor: const Color(0xFFA8A8A8),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('convert'),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: TextButton(
        style: TextButton.styleFrom(backgroundColor: Colors.blue.shade200),
        onPressed: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const CorrencyConverterCupertino()));
        },
        child: const Text('See Cupertino Design'),
      ),
    );
  }
}

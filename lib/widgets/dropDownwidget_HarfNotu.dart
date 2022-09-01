import 'package:flutter/material.dart';
import '../Consts/consts.dart';
import '../data/data.dart';

class DropDownHarfNotu extends StatefulWidget {
  final Function onHarfNotu;
  DropDownHarfNotu({
    super.key,
    required this.onHarfNotu,
  });

  @override
  State<DropDownHarfNotu> createState() => _DropDownHarfNotuState();
}

class _DropDownHarfNotuState extends State<DropDownHarfNotu> {
  double secilenHarfNotu = 5.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 18),
      decoration: BoxDecoration(
        borderRadius: Consts.dropDownRadius,
        color: Consts.textFormFieldBackGround,
      ),
      child: DropdownButton<double>(
        underline: Container(),
        value: secilenHarfNotu,
        items: itemBuild(),
        onChanged: ((value) {
          setState(() {
            secilenHarfNotu = value!;
            widget.onHarfNotu(secilenHarfNotu);
            
          });
        }),
      ),
    );
  }

  List<DropdownMenuItem<double>> itemBuild() {
    return harfNotuListesi
        .map((e) => DropdownMenuItem<double>(
            value: harfNotuBuilder(e), child: Center(child: Text(e))))
        .toList();
  }

  harfNotuBuilder(String harfnotu) {
    switch (harfnotu) {
      case "AA":
        return 5.0;
      case "AB":
        return 4.5;
      case "BB":
        return 4.0;
      case "BC":
        return 3.5;
      case "CC":
        return 3.0;
      case "CD":
        return 2.5;
      case "DD":
        return 2.0;
      case "DE":
        return 1.5;
      case "EE":
        return 1.0;
      case "FF":
        return 0.0;
      default:
        100.00;
    }
  }
}

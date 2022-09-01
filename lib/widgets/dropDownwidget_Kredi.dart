import 'package:dinamik_not_hesaplama/Consts/consts.dart';
import 'package:flutter/material.dart';
import '../data/data.dart';

class DropDownKrediNotu extends StatefulWidget {
  final Function harfNotu;
  const DropDownKrediNotu({super.key, required this.harfNotu});

  @override
  State<DropDownKrediNotu> createState() => _DropDownKrediNotu();
}

class _DropDownKrediNotu extends State<DropDownKrediNotu> {
  int secilenKredi = 5;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: Consts.dropDownRadius,
        color: Consts.textFormFieldBackGround,
      ),
      child: DropdownButton<int>(
        underline: Container(),
        value: secilenKredi,
        items: itemBuild(),
        onChanged: ((value) {
          setState(() {
            secilenKredi = value!;
            widget.harfNotu(secilenKredi);
          });
        }),
      ),
    );
  }

  List<DropdownMenuItem<int>> itemBuild() {
    return krediNotu
        .map((e) => DropdownMenuItem<int>(
            value: e, child: Center(child: Text(e.toString()))))
        .toList();
  }
}

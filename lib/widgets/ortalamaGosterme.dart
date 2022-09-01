import 'package:dinamik_not_hesaplama/Consts/consts.dart';
import 'package:flutter/material.dart';

class OrtalamaGosterme extends StatefulWidget {
  final double? ortalamaNot;
  final int? secilenDersSayisi;

  const OrtalamaGosterme(
    this.ortalamaNot,
    this.secilenDersSayisi, {
    super.key,
  });

  @override
  State<OrtalamaGosterme> createState() => _OrtalamaGostermeState();
}

class _OrtalamaGostermeState extends State<OrtalamaGosterme> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "${widget.secilenDersSayisi} Ders Girildi",
          style: Consts.OrtalamaGosterTitleTextStyle,
        ),
        Text(
          widget.ortalamaNot! > 0
              ? widget.ortalamaNot!.toStringAsFixed(2)
              : "0",
          style: Consts.NotTitleTextStyle,
        ),
        Text(
          "Ortalama",
          style: Consts.appBarTitleTextStyle,
        ),
      ],
    );
  }
}

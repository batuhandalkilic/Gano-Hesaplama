// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:dinamik_not_hesaplama/Consts/consts.dart';
import 'package:dinamik_not_hesaplama/data/data.dart';
import 'package:dinamik_not_hesaplama/widgets/listeGoster.dart';
import 'package:flutter/material.dart';
import '../data/üretilendatabase.dart';
import 'dropDownwidget_HarfNotu.dart';
import 'dropDownwidget_Kredi.dart';
import 'ortalamaGosterme.dart';

class HomaPage extends StatefulWidget {
  HomaPage({super.key});

  @override
  State<HomaPage> createState() => _HomaPageState();
}

class _HomaPageState extends State<HomaPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? girilenDersAdi;
  double? secilenHarfNotuu;
  int? secilenKredii;
  double ortDeger = 0;

  int toplamKredi = 0;
  List<UretilenDataBase> listtt = [];

  TextEditingController textFormFieldControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.delete,
              color: Color.fromARGB(255, 235, 233, 233),
            ),
            onPressed: (() {
              setState(() {
                listtt.clear();
                ortalamaHesaplama();
              });
            })),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Consts.appBarBackgroundColor,
          elevation: 0,
          title: Center(
            child: Text(
              Consts.appBarTitleText,
              style: Consts.appBarTitleTextStyle,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 2,
                    child: buildForm(),
                  ),
                  Expanded(
                    flex: 1,
                    child: OrtalamaGosterme(ortDeger, listtt.length),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListGoster(
                onDismss: (gelenindex) {
                  setState(() {
                    print(listtt);
                    print("listenin $gelenindex . indexi çıkarıldı!!!");
                    listtt.removeAt(gelenindex);
                    ortalamaHesaplama();
                  });
                },
                listt: listtt,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildForm() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: Column(children: [
        buildTextFormField(),
        SizedBox(
          height: 7,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DropDownHarfNotu(
              onHarfNotu: (secilenHarfNotu) {
                secilenHarfNotuu = secilenHarfNotu;
              },
            ),
            DropDownKrediNotu(harfNotu: (secilenKredi) {
              secilenKredii = secilenKredi;
            }),
            IconButton(
                iconSize: 30,
                onPressed: () {
                  setState(() {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      listtt.add(UretilenDataBase(
                          girilenDersAdi!, secilenHarfNotuu!, secilenKredii!));
                      ortalamaHesaplama();
                      textFormFieldControler.clear();
                    }
                  });
                },
                icon: Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Consts.anaRenk,
                )),
          ],
        )
      ]),
    );
  }

  TextFormField buildTextFormField() => TextFormField(
        controller: textFormFieldControler,
        onChanged: (value) {
          /* textFormFieldControler = textFormFieldControler; */

          textFormFieldControler.value = TextEditingValue(
              text: value,
              selection: TextSelection.collapsed(offset: value.length));
        },
        validator: (value) {
          if (value!.length < 5) {
            return "5 Haneden fazla olmalı";
          } else {
            return null;
          }
        },
        onSaved: (newValue) {
          setState(() {
            girilenDersAdi = newValue;
          });
        },
        autocorrect: true,
        decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.class_,
            color: Consts.anaRenk,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: Consts.borderRadius,
          ),
          filled: true,
          fillColor: Consts.textFormFieldBackGround,
          hintText: "Ders Adı Giriniz",
          hintStyle: Consts.hintStyleText,
        ),
      );

  ortalamaHesaplama() {
    double toplam = 0;
    int toplamKredi = 0;
    for (var i = 0; i < listtt.length; i++) {
      double harfnotuU = listtt[i].harfnotu;
      int krediNotu = listtt[i].kredi;
      toplam = toplam + (harfnotuU * krediNotu);
      toplamKredi = toplamKredi + krediNotu;
    }
    ortDeger = toplam / toplamKredi;
    return ortDeger;
  }
}

import 'package:dinamik_not_hesaplama/data/%C3%BCretilendatabase.dart';
import 'package:flutter/material.dart';
import 'homapage.dart';

class ListGoster extends StatefulWidget {
  final Function onDismss;
  final List<UretilenDataBase> listt;
  const ListGoster({
    super.key,
    required this.listt,
    required this.onDismss,
  });

  @override
  State<ListGoster> createState() => _ListGosterState();
}

class _ListGosterState extends State<ListGoster> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.listt.length,
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: UniqueKey(),
          onDismissed: (direction) {
            widget.onDismss(index);
          },
          child: Card(
            child: ListTile(
              title: Text(widget.listt[index].dersadi),
              subtitle: Text(
                  "${widget.listt[index].kredi.toStringAsFixed(2)} kredi, Not Değeri:${widget.listt[index].harfnotu.toStringAsFixed(2)}"),
              leading: CircleAvatar(
                child: Text(widget.listt[index].harfnotu.toStringAsFixed(0)),
              ),
            ),
          ),
        );
      },
    );
  }
}

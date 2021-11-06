import 'package:flutter/material.dart';
import 'package:getdone/models/color_theme_data.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tema Seçimi Yapınız:"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SwitchCard(),
    );
  }
}

class SwitchCard extends StatefulWidget {
  const SwitchCard({Key? key}) : super(key: key);

  @override
  _SwitchCardState createState() => _SwitchCardState();
}

class _SwitchCardState extends State<SwitchCard> {

  @override
  Widget build(BuildContext context) {
    Text greenText=Text('Green',style: TextStyle(color: Colors.green),);
    Text redText=Text('Red',style: TextStyle(color: Colors.red),);
    bool _value = Provider.of<ColorThemeData>(context).isGreen;
    return Card(
      child: SwitchListTile(
        subtitle: _value == true ? greenText : redText,
        title: Text('Change Theme Color',style:TextStyle(color:Colors.black)),
        value: _value,
        onChanged: (bool value) {
          setState(() {
            _value = value;
          });
          Provider.of<ColorThemeData>(context,listen: false).switchTheme(value);
        },
      ),
    );
  }
}

import 'main.dart';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyHomeScreen extends StatefulWidget {
  final void Function(String languageCode, bool switchState) setLocal;
  bool switchState;

  MyHomeScreen({super.key, required this.setLocal, required this.switchState});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.language),
        actions: [
          Switch(value: widget.switchState,  onChanged: (value) {
              widget.switchState = value;
            if(value){
              widget.setLocal('bn', true);
            }
            else {
              widget.setLocal('en', false);
            }
          })
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Text(AppLocalizations.of(context)!.bangladesh, style: const TextStyle(fontSize: 25),),
            Text(AppLocalizations.of(context)!.bangladesh_history)
          ],
        ),
      )
    );
  }
}



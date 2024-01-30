import 'package:first_app/phone_screen.dart';
import 'package:first_app/state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final stateData = Provider.of<DataState>(context);
    List languageItemList = ['English', 'Hindi'];
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.photo_size_select_actual_outlined,
            size: 60,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'Please select your Language',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
          Text(
            'You can change the language \n at any time',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey.shade600),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              width: 250,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black)),
              child: DropdownButton(
                  isExpanded: true,
                  hint: Text("Please Select "),
                  underline: Container(
                    height: 2,
                    // color: Colors.deepPurple,
                  ),
                  // icon: Icon(
                  //   Icons.arrow_drop_down_circle_outlined,
                  //   color: Colors.deepPurple,
                  // ),
                  value: stateData.language,
                  // items: menuItemList,
                  items: [0, 1]
                      .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(languageItemList[e].toString())))
                      .toList(),
                  onChanged: (value) {
                    stateData.setLanguage(value!);
                  })),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              if (stateData.language == null) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Select a language')));
                return;
              }
              Navigator.of(context).pushNamed(PhoneScreen.routeName);
            },
            child: Container(
              height: 60,
              width: 250,
              decoration: BoxDecoration(color: Color.fromARGB(255, 0, 46, 138)),
              child: Center(
                child: Text(
                  'CONTINUE',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}

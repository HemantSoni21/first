import 'package:first_app/state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  static const routeName = 'categoryscreen';

  @override
  Widget build(BuildContext context) {
    final stateData = Provider.of<DataState>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Please enter your profile',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () {
                  stateData.toggleShipperSelected();
                },
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                      Icon(
                        stateData.isShipper
                            ? Icons.radio_button_checked
                            : Icons.radio_button_off,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.house, size: 50),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Shipper',
                            style: TextStyle(fontSize: 23),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            'Lorem ipsum dolor sit amet, \nconsecetuer adipiscing',
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      )
                    ]),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  stateData.toggeleTransporterSelected();
                },
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                      Icon(
                        stateData.isTransporter
                            ? Icons.radio_button_checked
                            : Icons.radio_button_off,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.fire_truck_outlined, size: 50),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Transporter',
                            style: TextStyle(fontSize: 23),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            'Lorem ipsum dolor sit amet, \nconsecetuer adipiscing',
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      )
                    ]),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration:
                      BoxDecoration(color: Color.fromARGB(255, 0, 46, 138)),
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
            ]),
      ),
    );
  }
}

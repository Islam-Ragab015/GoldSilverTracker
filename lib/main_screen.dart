import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit/cubit.dart';
import 'package:flutter_application_1/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit()
        ..getGoldPrice()
        ..getSilverPrice(),
      child: BlocConsumer<MainCubit, States>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Today's ",
                      style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    Text(
                      "Prices",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ],
                ),
                backgroundColor: Colors.black,
                actions: [
                  IconButton(
                    icon: const Icon(Icons.refresh),
                    onPressed: () {
                      MainCubit.get(context).getGoldPrice();
                      MainCubit.get(context).getSilverPrice();
                    },
                  ),
                ],
              ),
              body: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [Colors.black, Colors.grey],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Gold column
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/gold.png",
                          height: MediaQuery.of(context).size.height / 7,
                          width: MediaQuery.of(context).size.width / 2.5,
                        ),
                        Text("Gold",
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width / 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange[100],
                              shadows: const [
                                BoxShadow(
                                  blurRadius: 4,
                                  offset: Offset(1, 1),
                                ),
                              ],
                            )),
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          child: Text(
                            "${MainCubit.get(context).goldPrice} 💵",
                            key: ValueKey(MainCubit.get(context).goldPrice),
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width / 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange[100],
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Silver column
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/silver.png",
                          height: MediaQuery.of(context).size.height / 7,
                          width: MediaQuery.of(context).size.width / 2.5,
                        ),
                        Text("Silver",
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width / 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[100],
                              shadows: const [
                                BoxShadow(
                                  blurRadius: 4,
                                  offset: Offset(1, 1),
                                ),
                              ],
                            )),
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          child: Text(
                            "${MainCubit.get(context).silverPrice} 💵",
                            key: ValueKey(MainCubit.get(context).silverPrice),
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width / 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[100],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              floatingActionButton: SizedBox(
                height: 70.0,
                width: 180.0,
                child: FittedBox(
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      MainCubit.get(context).getGoldPrice();
                      MainCubit.get(context).getSilverPrice();
                    },
                    backgroundColor: Colors.orange,
                    label: const Text(
                      "Refresh Prices",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    icon: const Icon(Icons.sync, color: Colors.black),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
            );
          }),
    );
  }
}

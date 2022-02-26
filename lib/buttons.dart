import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/counter_cubit.dart';

class CustomButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Color(0xFF4F1271), Color(0xFF783F8E)],
          ),
        ),
        child: Scaffold( 
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text(
              'counter'.toUpperCase(),
              style: const TextStyle(letterSpacing: 10),
            ),
          ),
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Ink(
                  decoration: const ShapeDecoration(
                    shape: CircleBorder(),
                    color: Color(0xFFBFACC8),
                  ),
                  child: IconButton(
                    padding: const EdgeInsets.all(20),
                    highlightColor: const Color(0xFFA36EBB),
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                    },
                    icon: const Icon(
                      Icons.remove_rounded,
                      color: Color(0xFF4A4063),
                    ),
                  ),
                ),
                BlocBuilder<CounterCubit, CounterState>(
                  builder: (context, state) {
                    return Container(
                      padding: const EdgeInsets.only(
                          top: 30, left: 40, bottom: 30, right: 40),
                      decoration: BoxDecoration(
                          color: const Color(0xFF783F8E),
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        state.counterValue.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color(0xFFC8C6D7),
                        ),
                      ),
                    );
                  },
                ),
                Ink(
                  decoration: const ShapeDecoration(
                    shape: CircleBorder(),
                    color: Color(0xFFBFACC8),
                  ),
                  child: IconButton(
                    padding: const EdgeInsets.all(20),
                    highlightColor: const Color(0xFFA36EBB),
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Color(0xFF4A4063),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

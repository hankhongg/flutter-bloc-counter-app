import "package:bloc_counter_app/bloc/counter_bloc.dart";
import "package:bloc_counter_app/cubit/counter_cubit.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    final counterCubit = BlocProvider.of<CounterCubit>(context);
    final counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      body: Center(
        child: GestureDetector(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.purpleAccent,
            ),
            child: const Text(
              "Tap Me",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold ,color: Colors.white),
            ),
            
          ),
          onTap: () => Navigator.of(context).pop(),
        )
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => counterBloc.add(CounterIncremented()),  //counterCubit.increment,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () => counterBloc.add(CounterDecremented()), // counterCubit.decrement,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          )
        ],
      )
    );
  }
}
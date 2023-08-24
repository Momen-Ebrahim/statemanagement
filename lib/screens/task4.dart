import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/cubit/replace_ui_cubit.dart';

class task4 extends StatelessWidget {
  task4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<ReplaceUiCubit, ReplaceUiState>(
                builder: (context, state) {
              switch (state.runtimeType) {
                case ShowText:
                  return Text("Hello We Are ITI");

                case ShowCubitImage:
                  return SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.network(
                        "https://pub.dev/packages/flutter_bloc/versions/8.1.3/gen-res/gen/190x190/logo.webp"),
                  );

                case ShowRedCircle:
                  return Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blue),
                  );

                default:
                  return Text(" No Button Clicked");
              }
            }),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<ReplaceUiCubit>().showText();
                },
                child: Text("Show text")),
            ElevatedButton(
                onPressed: () {
                  context.read<ReplaceUiCubit>().showCubitImage();
                },
                child: Text("Show cubit image")),
            ElevatedButton(
                onPressed: () {
                  context.read<ReplaceUiCubit>().showRedCircle();
                },
                child: Text("Show the red circle")),
            ElevatedButton(
                onPressed: () {
                  context.read<ReplaceUiCubit>().reset();
                },
                child: Text("Reset"))
          ],
        ),
      ),
    );
  }
}

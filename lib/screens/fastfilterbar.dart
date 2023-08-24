import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statemanagement/cubit/cubit/cubit/hidepass_cubit.dart';

import '../cubit/cubit/changecolor_cubit.dart';
import '../cubit/cubit/cubit/raido_cubit.dart';

class first extends StatefulWidget {
  first({super.key});

  @override
  State<first> createState() => _firstState();
}

List<String> moam = [
  "قيد التنفيذ",
  " الملغيه",
  " المكتمله",
  " تحت المراجعه",
  " تمت",
  "قيد التنفيذ",
  " الملغيه",
  " المكتمله",
  " تحت المراجعه",
  " تمت",
];

class _firstState extends State<first> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              child: SizedBox(
                height: 210,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocBuilder<ChangecolorCubit, ChangecolorState>(
                    builder: (context, state) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (int i = 0; i < moam.length; i++)
                              InkWell(
                                onTap: () {
                                  context
                                      .read<ChangecolorCubit>()
                                      .changevolor(i);
                                },
                                child: Container(
                                  width: 150,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: context
                                                .read<ChangecolorCubit>()
                                                .index ==
                                            i
                                        ? Colors.red
                                        : Colors.grey.shade500,
                                  ),
                                  child: Center(child: Text(moam[i])),
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: BlocBuilder<HidepassCubit, HidepassState>(
                builder: (context, state) {
                  return TextFormField(
                    obscureText: context.read<HidepassCubit>().ans,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password",
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(30)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.orange,
                          ),
                          borderRadius: BorderRadius.circular(30)),
                      suffixIcon: BlocBuilder<HidepassCubit, HidepassState>(
                        builder: (context, state) {
                          return IconButton(
                            icon: context.read<HidepassCubit>().ans
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                            onPressed: () {
                              context.read<HidepassCubit>().hide();
                            },
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 500,
              child: BlocBuilder<RaidoCubit, RaidoState>(
                builder: (context, state) {
                  return ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return RadioListTile(
                        title: Text("${index + 1}"),
                        subtitle: Text("hi"),
                        value: index,
                        groupValue: context.read<RaidoCubit>().real,
                        onChanged: (value) {
                          context.read<RaidoCubit>().real = value!;
                          context.read<RaidoCubit>().changeval();
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

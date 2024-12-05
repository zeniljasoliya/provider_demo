import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/My_practice/application_provider.dart';

class ApplicationDemo extends StatefulWidget {
  const ApplicationDemo({super.key});

  @override
  State<ApplicationDemo> createState() => _ApplicationDemoState();
}

class _ApplicationDemoState extends State<ApplicationDemo> {
  @override
  void dispose() {
    context.read<ApplicationProvider>().disposeTextField();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(' selectswich ');
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Selector<ApplicationProvider, TextEditingController>(
              builder: (context, value, child) {
                print('fname');
                return TextField(
                  controller: context
                      .read<ApplicationProvider>()
                      .txtFirstNameController,
                  decoration: const InputDecoration(labelText: 'FirstName'),
                );
              },
              selector: (context, obj) => obj.txtFirstNameController,
            ),
            Selector<ApplicationProvider, TextEditingController>(
              builder: (context, value, child) {
                print('mname');

                return TextField(
                  controller: context
                      .read<ApplicationProvider>()
                      .txtMiddleNameController,
                  decoration: const InputDecoration(labelText: 'MiddleName'),
                );
              },
              selector: (context, obj) => obj.txtMiddleNameController,
            ),
            Selector<ApplicationProvider, TextEditingController>(
              builder: (context, value, child) {
                print('lname');

                return TextField(
                  controller:
                      context.read<ApplicationProvider>().txtLastNameController,
                  decoration: const InputDecoration(labelText: 'LastName'),
                );
              },
              selector: (context, obj) => obj.txtLastNameController,
            ),
            Consumer<ApplicationProvider>(
              builder: (context, obj, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Gender:',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Radio(
                      value: obj.male,
                      groupValue: obj.gender,
                      onChanged: (value) {
                        print(' Male');

                        return context
                            .read<ApplicationProvider>()
                            .checkGender(value!);
                      },
                    ),
                    const Text('Male'),
                    Radio(
                      value: obj.female,
                      groupValue: obj.gender,
                      onChanged: (value) {
                        print(' Female');

                        return context
                            .read<ApplicationProvider>()
                            .checkGender(value!);
                      },
                    ),
                    const Text('Female'),
                  ],
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Hobbies:',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Selector<ApplicationProvider, bool>(
                          builder: (context, iscricket, child) {
                            print(' Cricket');

                            return Checkbox(
                              value: iscricket,
                              onChanged: (value) {
                                context
                                    .read<ApplicationProvider>()
                                    .selectcricket(value!);
                              },
                            );
                          },
                          selector: (context, obj) => obj.iscricket,
                        ),
                        const Text('Cricket'),
                      ],
                    ),
                    Row(
                      children: [
                        Selector<ApplicationProvider, bool>(
                          builder: (context, isfootball, child) {
                            print(' football');

                            return Checkbox(
                              value: isfootball,
                              onChanged: (value) {
                                context
                                    .read<ApplicationProvider>()
                                    .selectfootball(value!);
                              },
                            );
                          },
                          selector: (context, obj) => obj.isfootball,
                        ),
                        const Text('Football'),
                      ],
                    ),
                    Row(
                      children: [
                        Selector<ApplicationProvider, bool>(
                          builder: (context, isvolleyball, child) {
                            print(' volleyball');

                            return Checkbox(
                              value: isvolleyball,
                              onChanged: (value) {
                                context
                                    .read<ApplicationProvider>()
                                    .selectvolleyball(value!);
                              },
                            );
                          },
                          selector: (context, obj) => obj.isvolleyball,
                        ),
                        const Text('Volleyball'),
                      ],
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'IsActive:',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Selector<ApplicationProvider, bool>(
                  builder: (context, isactive, child) {
                    print('not selectswich ');
                    return CupertinoSwitch(
                      value: isactive,
                      onChanged: (value) {
                        context.read<ApplicationProvider>().selectswitch(value);
                      },
                    );
                  },
                  selector: (context, obj) => obj.isactive,
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Age:',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Selector<ApplicationProvider, double>(
                  builder: (context, selectedage, child) {
                    return CupertinoSlider(
                      min: 0,
                      max: 100,
                      value: selectedage.toDouble(),
                      onChanged: (value) {
                        context.read<ApplicationProvider>().selectage(value);
                        setState(() {});
                      },
                    );
                  },
                  selector: (context, obj) => obj.selectedage!,
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Stream:',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Selector<ApplicationProvider, List>(
                  shouldRebuild: (previous, next) => true,
                  builder: (context, value, child) {
                    return DropdownButton(
                      value: context.read<ApplicationProvider>().selectedstream,
                      items: List.generate(
                        value.length,
                        (index) => DropdownMenuItem(
                          value: value[index],
                          child: Text(
                            value[index],
                          ),
                        ),
                      ),
                      hint: const Text('Stream'),
                      onChanged: (value) {
                        context
                            .read<ApplicationProvider>()
                            .selectstream(value as String);
                      },
                    );
                  },
                  selector: (context, obj) => obj.streamdata,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                context.read<ApplicationProvider>().showdata();
                context.read<ApplicationProvider>().addData();
                context.read<ApplicationProvider>().clearData();
              },
              child: const Text('Submit'),
            ),
            const SizedBox(
              height: 20,
            ),
            Consumer<ApplicationProvider>(
              builder: (context, obj, child) {
                return obj.data.isEmpty
                    ? const Text('There is not data')
                    : Expanded(
                        child: ListView.builder(
                          itemCount: obj.data.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                obj.selectedIndex = index;
                                log('${obj.selectedIndex}');
                                context
                                    .read<ApplicationProvider>()
                                    .onTapUpdate();
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return SimpleDialog(
                                      children: [
                                        Column(
                                          children: [
                                            TextField(
                                              controller: context
                                                  .read<ApplicationProvider>()
                                                  .txtUpdateFirstNameController,
                                              decoration: const InputDecoration(
                                                  labelText: 'FirstName'),
                                            ),
                                            TextField(
                                              controller: context
                                                  .read<ApplicationProvider>()
                                                  .txtUpdateMiddleNameController,
                                              decoration: const InputDecoration(
                                                  labelText: 'MiddleName'),
                                            ),
                                            TextField(
                                              controller: context
                                                  .read<ApplicationProvider>()
                                                  .txtUpdateLastNameController,
                                              decoration: const InputDecoration(
                                                  labelText: 'LastName'),
                                            ),
                                            Consumer<ApplicationProvider>(
                                              builder: (context, obj, child) {
                                                return Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const Text(
                                                      'Gender:',
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Radio(
                                                      value: obj.maleupdate,
                                                      groupValue:
                                                          obj.genderupdate,
                                                      onChanged: (value) {
                                                        print(' Male');

                                                        return context
                                                            .read<
                                                                ApplicationProvider>()
                                                            .checkGenderDialog(
                                                                value!);
                                                      },
                                                    ),
                                                    const Text('Male'),
                                                    Radio(
                                                      value: obj.femaleupdate,
                                                      groupValue:
                                                          obj.genderupdate,
                                                      onChanged: (value) {
                                                        print(' Female');

                                                        return context
                                                            .read<
                                                                ApplicationProvider>()
                                                            .checkGenderDialog(
                                                                value!);
                                                      },
                                                    ),
                                                    const Text('Female'),
                                                  ],
                                                );
                                              },
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Text(
                                                  'Hobbies:',
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Selector<
                                                            ApplicationProvider,
                                                            bool>(
                                                          builder: (context,
                                                              iscricket,
                                                              child) {
                                                            print(' Cricket');

                                                            return Checkbox(
                                                              value: obj
                                                                  .iscricketupdate,
                                                              onChanged:
                                                                  (value) {
                                                                context
                                                                    .read<
                                                                        ApplicationProvider>()
                                                                    .selectcricketDialog(
                                                                        value!);
                                                              },
                                                            );
                                                          },
                                                          selector: (context,
                                                                  obj) =>
                                                              obj.iscricketupdate,
                                                        ),
                                                        const Text('Cricket'),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Selector<
                                                            ApplicationProvider,
                                                            bool>(
                                                          builder: (context,
                                                              isfootball,
                                                              child) {
                                                            print(' football');

                                                            return Checkbox(
                                                              value: obj
                                                                  .isfootballupdate,
                                                              onChanged:
                                                                  (value) {
                                                                context
                                                                    .read<
                                                                        ApplicationProvider>()
                                                                    .selectfootballDialog(
                                                                        value!);
                                                              },
                                                            );
                                                          },
                                                          selector: (context,
                                                                  obj) =>
                                                              obj.isfootballupdate,
                                                        ),
                                                        const Text('Football'),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Selector<
                                                            ApplicationProvider,
                                                            bool>(
                                                          builder: (context,
                                                              isvolleyball,
                                                              child) {
                                                            print(
                                                                ' volleyball');

                                                            return Checkbox(
                                                              value: obj
                                                                  .isvolleyballupdate,
                                                              onChanged:
                                                                  (value) {
                                                                context
                                                                    .read<
                                                                        ApplicationProvider>()
                                                                    .selectvolleyballDialog(
                                                                        value!);
                                                              },
                                                            );
                                                          },
                                                          selector: (context,
                                                                  obj) =>
                                                              obj.isvolleyballupdate,
                                                        ),
                                                        const Text(
                                                            'Volleyball'),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Text(
                                                  'IsActive:',
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Selector<ApplicationProvider,
                                                    bool>(
                                                  builder: (context, isactive,
                                                      child) {
                                                    print('not selectswich ');
                                                    return CupertinoSwitch(
                                                      value: obj.isactiveupdate,
                                                      onChanged: (value) {
                                                        context
                                                            .read<
                                                                ApplicationProvider>()
                                                            .selectswitchDialog(
                                                                value);
                                                      },
                                                    );
                                                  },
                                                  selector: (context, obj) =>
                                                      obj.isactiveupdate,
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Text(
                                                  'Age:',
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Selector<ApplicationProvider,
                                                    double>(
                                                  builder: (context,
                                                      selectedage, child) {
                                                    return CupertinoSlider(
                                                      min: 0,
                                                      max: 100,
                                                      value: obj
                                                          .selectedageupdate!
                                                          .toDouble(),
                                                      onChanged: (value) {
                                                        context
                                                            .read<
                                                                ApplicationProvider>()
                                                            .selectageDialog(
                                                                value);
                                                        setState(() {});
                                                      },
                                                    );
                                                  },
                                                  selector: (context, obj) =>
                                                      obj.selectedageupdate!,
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Text(
                                                  'Stream:',
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Selector<ApplicationProvider,
                                                    List>(
                                                  shouldRebuild:
                                                      (previous, next) => true,
                                                  builder:
                                                      (context, value, child) {
                                                    return DropdownButton(
                                                      value: context
                                                          .read<
                                                              ApplicationProvider>()
                                                          .selectedstreamupdate,
                                                      items: List.generate(
                                                        value.length,
                                                        (index) =>
                                                            DropdownMenuItem(
                                                          value: value[index],
                                                          child: Text(
                                                            value[index],
                                                          ),
                                                        ),
                                                      ),
                                                      hint:
                                                          const Text('Stream'),
                                                      onChanged: (value) {
                                                        context
                                                            .read<
                                                                ApplicationProvider>()
                                                            .selectstreamDialog(
                                                                value
                                                                    as String);
                                                      },
                                                    );
                                                  },
                                                  selector: (context, obj) =>
                                                      obj.streamdataupdate,
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                MaterialButton(
                                                  onPressed: () {
                                                    context
                                                        .read<
                                                            ApplicationProvider>()
                                                        .updateData();
                                                    context
                                                        .read<
                                                            ApplicationProvider>()
                                                        .clearUpdateData();
                                                    context
                                                        .read<
                                                            ApplicationProvider>()
                                                        .updateButton(context);
                                                  },
                                                  child: const Text('Update'),
                                                ),
                                                MaterialButton(
                                                  onPressed: () {
                                                    context
                                                        .read<
                                                            ApplicationProvider>()
                                                        .cancleButton(context);
                                                  },
                                                  child: const Text('Cancle'),
                                                )
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Dismissible(
                                key: UniqueKey(),
                                onDismissed: (direction) {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text('Are you sure?'),
                                        actions: [
                                          MaterialButton(
                                            onPressed: () {
                                              context
                                                  .read<ApplicationProvider>()
                                                  .deleteButton(context, index);
                                            },
                                            child: const Text('Delete'),
                                          ),
                                          MaterialButton(
                                            onPressed: () {
                                              context
                                                  .read<ApplicationProvider>()
                                                  .cancleDeleteButton(context);
                                            },
                                            child: const Text('cancle'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  height: 130,
                                  color: Colors.grey,
                                  width: double.infinity,
                                  child: Column(
                                    children: [
                                      Text(
                                          'Name:${obj.data[index]['fname']} ${obj.data[index]['mname']} ${obj.data[index]['lname']} '),
                                      Text(
                                          'Gender: ${obj.data[index]['gender']}'),
                                      Text(
                                          'Hobby: ${obj.data[index]['hobby']}'),
                                      Text('Age: ${obj.data[index]['age']}'),
                                      Text(
                                          'Stream: ${obj.data[index]['stream']}'),
                                      Text(
                                          'Switch: ${obj.data[index]['isactive']}'),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
              },
            ),
            // Consumer<ApplicationProvider>(
            //   builder: (context, obj, child) {
            //     return obj.issubmitted == true
            //         ? Container(
            //             height: 100,
            //             width: 300,
            //             color: Colors.grey,
            //             child: Column(
            //               children: [
            //                 Text(
            //                     'Name:${obj.txtFirstNameController.text} ${obj.txtMiddleNameController.text} ${obj.txtLastNameController.text}'),
            //                 Text('Gender:${obj.gender}'),
            //                 Text('Hobby:${obj.selectedhobby}'),
            //                 Text('IsActive:${obj.isactive}'),
            //                 Text('Stream:${obj.selectedstream}'),
            //                 Text('Age:${obj.selectedage!.round()}'),
            //               ],
            //             ),
            //           )
            //         : const SizedBox();
            //   },
            // )
          ],
        ),
      ),
    );
  }
}

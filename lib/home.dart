import 'package:flutter/material.dart';
import 'package:lab4/services/agify.dart';

class Home extends StatefulWidget {
  final AgifyService agifyService;

  const Home({Key? key})
      : agifyService = const AgifyService(),
        super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _key = GlobalKey<FormState>();

  String? name;
  int? age;

  void onSubmit() async {
    if (_key.currentState!.validate()) {
      _key.currentState!.save();
      final calculatedAge = await widget.agifyService.getAgeFromName(name!);

      setState(() {
        age = calculatedAge;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Center(
          child: Column(
        children: [
          Form(
              key: _key,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: TextFormField(
                      onChanged: ((value) => {}),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 163, 184, 223),
                                width: 5)),
                        helperText: 'Name',
                        labelText: 'Name',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter the name";
                        }
                        return null;
                      },
                      onSaved: (String? value) {
                        setState(() {
                          if (value != null) name = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: onSubmit,
                    child: const Text("Get Age"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  if (age != null)
                    Center(
                      child: Column(children: [
                        Text(
                          'Age is $age',
                          style: Theme.of(context).textTheme.headline3,
                        )
                      ]),
                    )
                ],
              ))
        ],
      )),
    );
  }
}

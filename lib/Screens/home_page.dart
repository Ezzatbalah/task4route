import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FormState> formState = GlobalKey();
  final nameController = TextEditingController();
  final numberControllar = TextEditingController();
  List<Widget> dataContiner = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 160, 157, 157),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Center(
            child: Text(
          "Contant Screen",
          style: TextStyle(color: Colors.white),
        )),
      ),
      body: Form(
        key: formState,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "text is empty";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    label: const Text('Enter Your name'),
                    labelStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    suffixIcon: const Icon(
                      Icons.edit,
                      color: Colors.blue,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25))),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: numberControllar,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "text is empty";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    label: const Text('Enter Your phone'),
                    labelStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    suffixIcon: const Icon(
                      Icons.phone,
                      color: Colors.blue,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25))),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 400,
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(Colors.blueAccent),
                    ),
                    onPressed: () {
                      if (formState.currentState!.validate()) {
                        addText();
                      } else {}
                    },
                    child: const Text(
                      "Add",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Column(
                  children: dataContiner,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  addText() {
    if (nameController.text.isNotEmpty && numberControllar.text.isNotEmpty) {
      if (dataContiner.length < 3) {
        setState(() {
          dataContiner.add(
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              height: 70,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(25)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name: ${nameController.text}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "phone: ${numberControllar.text}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          dataContiner.removeLast();
                        });
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
      }
    } else {
      return const SizedBox();
    }
    nameController.clear();
    numberControllar.clear();
  }
}

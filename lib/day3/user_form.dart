import 'package:flutter/material.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  State<UserForm> createState() => _UserFormState();
}

/// TODO: Gender without enum
enum Gender { male, female }

class _UserFormState extends State<UserForm> {
  Gender? gender;

  var selectValue = 0;

  DateTime? selectDate;
  final _formKey = GlobalKey<FormState>();

  final String _email = 'abc@gmail.com';

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text("User Form"), elevation: 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Username",
                    hintText: "Enter Username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter a Username";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Contact",
                    hintText: "Contact no.",

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your Contact no.";
                    } else if (value.length < 10 || value.length > 10) {
                      return "Enter valid mobile no";
                    }
                    return null;
                  },
                ),

                IgnorePointer(

                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    initialValue: _email,
                    decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "Email",
                      fillColor: Colors.grey[200],
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                StatefulBuilder(
                  builder: (context, setState) {
                    return TextFormField(
                      controller: controller,
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          firstDate: DateTime.now().subtract(Duration(days: 3)),
                          lastDate: DateTime.now().add(Duration(days: 90)),
                        );

                        if (pickedDate != null) {
                          setState(() {
                            // print(
                            //   '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}',
                            // );
                            selectDate = pickedDate;
                            controller.text =
                                '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';
                          });
                        }
                      },
                      decoration: InputDecoration(
                        labelText: "Date of Birth",

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Select date of birth";
                        }
                        return null;
                      },
                    );
                  },
                ),
                DropdownButtonFormField(
                  hint: Text('Gender'),

                  items: [
                    DropdownMenuItem(value: null, child: Text('Select')),
                    DropdownMenuItem(value: 'male', child: Text('Male')),
                    DropdownMenuItem(value: 'female', child: Text('Female')),
                  ],
                  onChanged: (value) {
                    gender = value as Gender?;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please select gender";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                // StatefulBuilder(
                //   builder: (context, setState){
                //     return DropdownMenu(
                //       initialSelection: "male",
                //       label: Text("Gender"),
                //       hintText: "Gender",
                //       width: MediaQuery.of(context).size.width * 0.9,
                //       dropdownMenuEntries: [
                //         DropdownMenuEntry(value: 'male', label: 'Male'),
                //         DropdownMenuEntry(value: 'female', label: 'Female'),
                //       ],
                //       onSelected: (value) {
                //         setState(() {
                //           // print(value);
                //         });
                //       },
                //
                //     );
                //   },
                //
                // ),
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  minLines: 3,
                  maxLines: 4,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    labelText: "Address",
                    hintText: "Address",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter a Address";
                    }
                    return null;
                  },
                ),

                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                  child: Text("Submit"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:contact_form/presentation/styles/style_constants.dart';
import 'package:flutter/material.dart';

import 'package:email_validator/email_validator.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black, size: 24,),
          onPressed: () {},
        ),
        title: Text(
          "Contact us",
          style: titleTextStyle,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SizedBox(
          height: 400,
          child: Column(
            children: [
              Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Expanded(
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 20, top: 30, bottom: 0),
                        child: ListTile(
                          leading: Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: lockIcon,
                          ),
                          title: TextFormField(
                            initialValue: "",
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              hintText: "Name",
                              hintStyle: hintTextStyle
                            ),
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'Provide your name!';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 20, top: 30, bottom: 0),
                        child: ListTile(
                          leading: Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: lockIcon,
                          ),
                          title: TextFormField(
                            initialValue: "",
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: "Email",
                              hintStyle: hintTextStyle,
                            ),
                            validator: (value) {
                              var emailRegexp = RegExp(
                                r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$'
                              );
                              if (value?.isEmpty ?? true) {
                                return 'Provide your email!';
                              }
                              if(!EmailValidator.validate(value!)){
                                return 'Invalid email format';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 20, top: 30, bottom: 0),
                        child: ListTile(
                          leading: Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: lockIcon,
                          ),
                          title: TextFormField(
                            initialValue: "",
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: "Message",
                              hintStyle: hintTextStyle,
                            ),
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'Input your message!';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 35, right: 35),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: submittButtonColor,
                      padding: const EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      alignment: Alignment.center,
                      child: Text(
                        'Send',
                        style: sendButtonTextStyle,
                      ),
                    ),
                  ),
                ),
              )
            ]
          ),
        ),
      ),
    );
  }
}
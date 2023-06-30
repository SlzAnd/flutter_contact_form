import 'package:contact_form/logic/contact_form_service.dart';
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
  bool isSending = false;
  String? errorMessage;
  String? successMessage;
  TextEditingController nameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController messageTextController = TextEditingController();

  void sendForm() async {
    if(formKey.currentState!.validate()){
      setState(() {
      isSending = true;
      errorMessage = null;
      successMessage = null;
    });

    var name = nameTextController.text;
    var email = emailTextController.text;
    var message = messageTextController.text;

    var contactFormService = ContactFormService();

    var isSuccess = await contactFormService.submitForm(
      name: name,
      email: email,
      message: message,
    );

    if (isSuccess) {
      setState(() {
        successMessage = 'Your message was successfully sent!';
      });
      nameTextController.clear();
      emailTextController.clear();
      messageTextController.clear();
    } else {
      setState(() {
        errorMessage = 'Something went wrong. Please try again.';
      });
    }

    setState(() {
      isSending = false;
    });
    }
  }

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
          height: 390,
          child: Column(
            children: [
              Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Expanded(
                  child: ListView(
                    children: [
                      // Text field for name
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

                      // Text field for email
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

                      // Text field for message
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
                            minLines: 1,
                            maxLines: 6,
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
                padding: const EdgeInsets.only(left: 35, right: 35),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: isSending ? null : sendForm,
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
                      child: isSending
                      ? Text(
                        'Please wait',
                        style: sendButtonTextStyle,
                      )
                      : Text(
                        'Send',
                        style: sendButtonTextStyle,
                      ),
                    ),
                  ),
                ),
              ),
              if (errorMessage != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              if (successMessage != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    successMessage!,
                    style: const TextStyle(color: Colors.green),
                  ),
                ),
            ]
          ),
        ),
      ),
    );
  }
}
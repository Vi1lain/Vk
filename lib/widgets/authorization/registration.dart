import 'package:flutter/material.dart';
import 'package:vk/widgets/authorization/reg_login.dart';

class Registration extends StatelessWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarVK(),
      backgroundColor: Color.fromARGB(255, 250, 250, 250),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("icons/vk.png", width: 22, height: 22),
                Text("ID",
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              ],
            ),
            Container(
              height: 20,
            ),
            Text("Введите номер",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: Text(
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                  textAlign: TextAlign.center,
                  "Ваш номер телефона будет использоваться для входа в аккаунт"),
            ),
            textRegistration(),
            ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blueAccent),
                    minimumSize:
                        MaterialStateProperty.all(Size(double.maxFinite, 53))),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const RegLogin();
                  }));
                },
                child: const Text(
                    style: TextStyle(color: Colors.white), "Продолжить")),
            Container(
              height: 8,
            ),
            Text(
                style: TextStyle(fontSize: 12, color: Colors.grey),
                textAlign: TextAlign.center,
                "Нажимая «Продолжить», вы принимаете пользовательское соглашение и политику конфиденциальности"),
          ],
        ),
      ),
    );
  }
}

class AppBarVK extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(40);

  const AppBarVK({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Вконтакте"),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_outlined),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

class textRegistration extends StatefulWidget {
  const textRegistration({Key? key}) : super(key: key);

  @override
  State<textRegistration> createState() => _textRegistrationState();
}

class _textRegistrationState extends State<textRegistration> {
  bool isChecked = true;
  String _number = "+7";

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blueAccent;
    }
    return Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          TextFormField(
            initialValue: _number,
            maxLength: 16,
            decoration: InputDecoration(contentPadding: EdgeInsets.zero,
                hintText: "Введите номер телефона",
                hintStyle: TextStyle(color: Colors.black26),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black26,
                    ),
                    borderRadius: BorderRadius.circular(10))),
          ),
          Row(
            children: [
              Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
              Text(
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                  "Сохранить вход"),
            ],
          )
        ],
      ),
    );
  }
}

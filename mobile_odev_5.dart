import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: UserRegistrationScreen(),
    );
  }
}

class UserRegistrationScreen extends StatefulWidget {
  @override
  _UserRegistrationScreenState createState() => _UserRegistrationScreenState();
}

class _UserRegistrationScreenState extends State<UserRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _email;
  String? _password;

  // Tema durumu
  bool _isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(_isDarkTheme ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              setState(() {
                _isDarkTheme = !_isDarkTheme; // Tema durumu değiştir
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20),
                Text(
                  'Hesap Oluştur',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: _isDarkTheme ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'İsim',
                    labelStyle: TextStyle(color: _isDarkTheme ? Colors.black : Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(color: _isDarkTheme ? Colors.white : Colors.grey[400]!),
                    ),
                    hintText: 'Adınızı girin',
                    hintStyle: TextStyle(color: _isDarkTheme ? Colors.black54 : Colors.black54),
                    contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                    filled: true,
                    fillColor: _isDarkTheme ? Colors.white : Colors.grey[300],
                  ),
                  style: TextStyle(color: _isDarkTheme ? Colors.black : Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen isminizi girin';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'E-posta',
                    labelStyle: TextStyle(color: _isDarkTheme ? Colors.black : Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(color: _isDarkTheme ? Colors.white : Colors.grey[400]!),
                    ),
                    hintText: 'E-posta adresinizi girin',
                    hintStyle: TextStyle(color: _isDarkTheme ? Colors.black54 : Colors.black54),
                    contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                    filled: true,
                    fillColor: _isDarkTheme ? Colors.white : Colors.grey[300],
                  ),
                  style: TextStyle(color: _isDarkTheme ? Colors.black : Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen e-posta adresinizi girin';
                    }
                    final RegExp emailRegex = RegExp(
                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                    );
                    if (!emailRegex.hasMatch(value)) {
                      return 'Geçerli bir e-posta adresi girin';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _email = value;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Şifre',
                    labelStyle: TextStyle(color: _isDarkTheme ? Colors.black : Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(color: _isDarkTheme ? Colors.white : Colors.grey[400]!),
                    ),
                    hintText: 'Şifrenizi girin',
                    hintStyle: TextStyle(color: _isDarkTheme ? Colors.black54 : Colors.black54),
                    contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                    filled: true,
                    fillColor: _isDarkTheme ? Colors.white : Colors.grey[300],
                  ),
                  obscureText: true,
                  style: TextStyle(color: _isDarkTheme ? Colors.black : Colors.black),
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return 'Şifre en az 6 karakter olmalıdır';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _password = value;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Kayıt başarılı')),
                      );
                      print('İsim: $_name, E-posta: $_email, Şifre: $_password');
                    }
                  },
                  child: Text(
                    'Kaydol',
                    style: TextStyle(
                      color: _isDarkTheme ? Colors.white : Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isDarkTheme ? Colors.black : Colors.grey[800], 
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: TextButton(
                    onPressed: () {
                      // Giriş sayfasına yönlendirme
                    },
                    child: Text(
                      'Zaten bir hesabınız var mı? Giriş yapın',
                      style: TextStyle(color: _isDarkTheme ? Colors.white : Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: _isDarkTheme ? Colors.grey[850] : Colors.white,
    );
  }
}

import 'package:flutter/material.dart';

class FormExampleScreen extends StatefulWidget {
  const FormExampleScreen({super.key});

  @override
  State<FormExampleScreen> createState() => _FormExampleScreenState();
}

class _FormExampleScreenState extends State<FormExampleScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _password = '';
  String _phone = '';
  String _address = '';
  String _birthYear = '';
  String _cinsiyet = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form ')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Ad Soyad'),
                validator:
                    (value) =>
                        value == null || value.isEmpty ? 'Zorunlu alan' : null,
                onSaved: (value) => _name = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'E-posta'),
                keyboardType: TextInputType.emailAddress,
                validator:
                    (value) =>
                        value != null && value.contains('@')
                            ? null
                            : 'Geçersiz e-posta',
                onSaved: (value) => _email = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Şifre'),
                obscureText: true,
                validator:
                    (value) =>
                        value == null || value.length < 6
                            ? 'En az 6 karakter olmalı'
                            : null,
                onSaved: (value) => _password = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Telefon Numarası',
                ),
                keyboardType: TextInputType.phone,
                maxLength: 10,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Zorunlu alan';
                  } else if (value.length != 10) {
                    return '10 haneli numara girin';
                  }
                  return null;
                },
                onSaved: (value) => _phone = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Adres'),
                maxLines: 3,
                validator:
                    (value) =>
                        value == null || value.isEmpty ? 'Zorunlu alan' : null,
                onSaved: (value) => _address = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Doğum yili'),
                keyboardType: TextInputType.datetime,
                maxLength: 4,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'zorunlu alan';
                  } else if (value.length != 4) {
                    return '4 haneli yıl girin';
                  }
                  return null;
                },
                onSaved: (value) => _birthYear = value!,
              ),

              Row(
                children: [
                  const Text('Cinsiyet: '),
                  const SizedBox(width: 10),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      items: const [
                        DropdownMenuItem(value: 'Erkek', child: Text('Erkek')),
                        DropdownMenuItem(value: 'Kadın', child: Text('Kadın')),
                      ],
                      onChanged: (value) {},
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      validator:
                          (value) => value == null ? 'Zorunlu alan' : null,
                      onSaved: (value) => _cinsiyet = value!,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Gönder'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Ad: $_name\nE-posta: $_email \nŞifre: $_password\n'
            'Telefon: $_phone\nAdres: $_address\nDoğum Yılı: $_birthYear\n',
          ),
        ),
      );
    }
  }
}

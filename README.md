# sample_feature_flag
Here is an example of Firebase Remote Config in Flutter

This app is a joke application that mimics an e-commerce site that I created to explain the remote configuration feature of Firebase!

- https://firebase.google.com/docs/remote-config
- https://pub.dev/packages/firebase_remote_config
- https://firebase.flutter.dev/docs/remote-config/overview/


<img src=https://user-images.githubusercontent.com/53109993/139188543-31f646f6-f44b-4399-8a77-48fba1f7dc0c.png width=300 /> <img src=https://user-images.githubusercontent.com/53109993/139188552-37290f2f-ae80-43d8-8fd9-d8b851bd3e15.png width=300 /> <img src=https://user-images.githubusercontent.com/53109993/139188553-91d3193a-cfcc-4865-ac92-7f69030ef55c.png width=300 />

```
jsonItemList = [
    {'id': '1a', 'emoji': '๐ป', 'title': 'Macbook Pro', 'price': '240000'},
    {'id': '1b', 'emoji': '๐ฎ', 'title': 'Switch', 'price': '38000'},
    {'id': '1c', 'emoji': '๐ฟ', 'title': 'CD', 'price': '3000'},
    {'id': '1d', 'emoji': '๐', 'title': 'ใซใฌใผ', 'price': '800'},
    {'id': '1e', 'emoji': '๐ฃ', 'title': 'ๅฏฟๅธ', 'price': '4000'},
    {'id': '1f', 'emoji': '๐', 'title': 'ใฉใผใกใณ', 'price': '1000'},
    {'id': '1g', 'emoji': '๐', 'title': 'ใใณใใผใฌใผ', 'price': '300'},
    {'id': '1h', 'emoji': '๐ฅฉ', 'title': '่', 'price': '4000'},
    {'id': '1i', 'emoji': '๐', 'title': '้ญ', 'price': '300'},
    {'id': '1j', 'emoji': '๐', 'title': 'ในใใคใซ', 'price': '0'},
];
```

# slide 
- https://docs.google.com/presentation/d/1Rzf1i6Kq5FWtlaGwG-ISVz_R0WYHZeozOT2sjyphtTc/edit?usp=sharing

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# firebase 
firebaseใฎ่จญๅฎใใกใคใซใฏๅซใใงใใชใใฎใง
ๅ่ชfirebaseใฎ็ฐๅขใ่จญๅฎๅพใซ `GoogleService-Info.plist` `google-services.json` ใใใฆใณใญใผใใใฆ่จญๅฎใใฆใใ?ใใ

- https://firebase.google.com/docs/flutter/setup?hl=ja&platform=ios
- https://firebase.google.com/docs/flutter/setup?hl=ja&platform=android

<img width="1406" alt="Screen Shot 2021-10-26 at 1 45 38" src="https://user-images.githubusercontent.com/53109993/138872385-2378e7e2-12a0-4d2e-aff1-8abbd0370ed9.png">


# android

1. keystoreไฝๆ
  ```
  keytool -genkey -v -alias <AliasName> -keystore <Filename>.jks
  ```

   example: `keytool -genkey -v -alias key -keystore key.jks`

2. Rootใซไฝๆใใใjksใใกใคใซใ `/android/app/` ้ไธใซ้็ฝฎ

3. `/android/` ้ไธใซ `key.properties`ใใไฝๆ

4. propertiesใใกใคใซใซไปฅไธใฎ่จญๅฎใ่ฟฝ่จ
```
storePassword=<Password>
keyPassword=<Filename>
keyAlias=<AliasName>
storeFile=./<Filename>.jks
```
5. SHA ่จผๆๆธใใฃใณใฌใผใใชใณใใfirebaseใใญใธใงใฏใใซ็ป้ฒ
`keytool -list -v -keystore ./path/to/<Filename>.jks -alias <AliasName>`

 example: `keytool -list -v -keystore ./android/app/key.jks -alias key`



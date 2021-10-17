# sample_feature_flag

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# android

1. keystore作成
  ```
  keytool -genkey -v -alias <AliasName> -keystore <Filename>
  ```

   example: `keytool -genkey -v -alias key -keystore key.jks`

2. Rootに作成されたjksファイルを `/android/app/` 配下に配置

3. `/android/` 配下に `key.properties`　を作成

4. propertiesファイルに以下の設定を追記
```
storePassword=<Password>
keyPassword=<Filename>
keyAlias=<AliasName>
storeFile=./<Filename>.jks
```
5. SHA1証明書フィンガープリント firebaseプロジェクトに登録

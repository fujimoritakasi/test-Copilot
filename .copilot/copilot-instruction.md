# あみだくじアプリ - Copilot 開発ガイド

## リポジトリ概要

このプロジェクトは、Flutter フレームワークで開発されたあみだくじ（Amidakuji）アプリです。

### プロジェクトの目的
- 複数のプレイヤーが参加する週当番決めアプリ
- 各プレイヤーの休日を考慮した公平な抽選機能
- クロスプラットフォーム対応（iOS、Android、Web、Windows）

### 主要機能
- **プレイヤー管理**: JSONファイルからプレイヤー情報を読み込み、動的に追加・削除
- **休日設定**: 各プレイヤーの休日を設定して抽選から除外
- **あみだくじ実行**: 公平な抽選アルゴリズムで週当番を決定
- **結果表示**: 各プレイヤーの担当曜日と回避状況を表示

## フォルダ構成

```
flutter_sample/
├── lib/                          # メインソースコード
│   ├── main.dart                 # アプリのエントリーポイント
│   ├── bloc/                     # BLoCパターンによる状態管理
│   │   ├── bloc/                 # 複雑な状態管理（AmidaResultBloc）
│   │   ├── cubit/                # シンプルな状態管理（PlayersCubit）
│   │   └── observer/             # BLoC監視・デバッグ用
│   ├── model/                    # データモデル
│   │   ├── player.dart           # プレイヤーモデル
│   │   ├── players.dart          # プレイヤーリストモデル
│   │   ├── day.dart              # 曜日列挙型
│   │   ├── duty.dart             # 当番情報モデル
│   │   ├── amida_result.dart     # あみだくじ結果モデル
│   │   └── amidakuji.dart        # あみだくじロジック
│   ├── service/                  # ビジネスロジック層
│   │   └── amida_result_service.dart  # あみだくじ実行サービス
│   └── *.dart                    # UIコンポーネント
├── assets/                       # 静的リソース
│   └── player/
│       └── players.json          # プレイヤーデータ
├── test/                         # テストコード
├── android/                      # Android固有設定
├── ios/                          # iOS固有設定
├── web/                          # Web固有設定
├── windows/                      # Windows固有設定
├── pubspec.yaml                  # 依存関係管理
└── analysis_options.yaml        # コード解析設定
```

### 各フォルダの役割

- **lib/**: Dartで書かれたメインアプリケーションコード
- **bloc/**: BLoCパターンによる状態管理コード
- **model/**: データ構造とビジネスロジック
- **service/**: 外部データアクセスとビジネスサービス
- **assets/**: 画像、JSON、その他の静的ファイル
- **test/**: ユニットテストとウィジェットテスト
- **android/ios/web/windows/**: 各プラットフォーム固有の設定

## 技術スタック

### 使用言語
- **Dart**: メインプログラミング言語（バージョン: >=2.16.1 <3.0.0）
- **Java**: Android プラットフォーム用（最小限のボイラープレート）
- **CMake**: Windows ビルド設定

### フレームワーク
- **Flutter**: クロスプラットフォームUIフレームワーク
- **flutter_bloc**: 状態管理ライブラリ（BLoCパターン実装）

### ビルドツール
- **Flutter SDK**: アプリケーションのビルドとパッケージング
- **Gradle**: Android プラットフォーム用ビルドシステム
- **CMake**: Windows プラットフォーム用ビルドシステム

### 主要依存関係

**本番依存関係**:
- `flutter`: コアフレームワーク
- `flutter_bloc: ^8.0.1`: 状態管理
- `cupertino_icons: ^1.0.2`: iOS スタイルアイコン

**開発依存関係**:
- `flutter_test`: テストフレームワーク
- `flutter_lints: ^1.0.0`: コード品質チェック

## コーディング規約

### Dart命名規則
- **クラス名**: PascalCase（例: `AmidaResultBloc`, `PlayersCubit`）
- **メソッド名・変数名**: camelCase（例: `executeAmidakuji`, `dutyDay`）
- **定数**: camelCase（例: `limitLoopCounterValue`）
- **ファイル名**: snake_case（例: `amida_result_bloc.dart`）

### Flutter固有の規約
- **Widget命名**: 末尾に"Widget"を付ける（例: `AmidakujiResultAreaWidget`）
- **StatefulWidget**: 状態を持つUIコンポーネント
- **StatelessWidget**: 状態を持たないUIコンポーネント
- **Key使用**: ウィジェット識別のため適切にKeyを使用

### BLoCパターン規約
- **Bloc**: 複雑な状態管理とイベント処理
- **Cubit**: シンプルな状態管理
- **State**: 不変オブジェクトとして実装
- **Event**: ユーザーアクションやシステムイベント

### パッケージ構成のルール
- **model/**: データモデルとビジネスロジック
- **bloc/**: 状態管理関連コード
- **service/**: 外部サービスとの連携
- **UI コンポーネント**: 機能別にファイル分割

### コメント記述方針
- **日本語コメント**: ビジネスロジックの説明
- **英語コメント**: 技術的な説明
- **TODO コメント**: 将来の改善点を明記
- **Dartdoc**: 公開APIに対するドキュメント

### 特記事項
- JSONファイルから動的にプレイヤー情報を読み込む設計
- 休日制約を考慮した抽選アルゴリズム実装
- エラーハンドリングとループ制限による安全性確保
- マルチプラットフォーム対応のためのファイル構成
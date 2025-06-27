# Copilot開発支援ドキュメント

## 1. リポジトリ概要

### プロジェクトの目的と機能
このプロジェクトは「あみだくじアプリ」というFlutterアプリケーションです。あみだくじ（Ghost Leg）アルゴリズムを使用して、複数のプレイヤーに対して平日（月〜金）の当番を公平に割り当てるアプリケーションです。

### 主要な機能
- **プレイヤー管理**: プレイヤーの追加・削除機能
- **休み希望設定**: 各プレイヤーが当番を避けたい曜日を設定可能
- **あみだくじ実行**: 休み希望を考慮した当番の自動割り当て
- **結果表示**: 割り当て結果をわかりやすく表示
- **多言語対応**: 日本語UIでの操作

### 対象ユーザー・ビジネス要件
- **対象ユーザー**: 職場やチームで当番制を導入している組織
- **ビジネス要件**: 
  - 公平な当番割り当て
  - 個人の都合（休み希望）を考慮
  - 直感的で使いやすいUI
  - 複数プラットフォーム対応

## 2. フォルダ構成

### ディレクトリ構造の詳細

```
flutter_sample/
├── lib/                          # メインソースコード
│   ├── bloc/                     # 状態管理（BLoC pattern）
│   │   ├── bloc/                 # 複雑な状態管理
│   │   │   ├── amida_result_bloc.dart      # あみだくじ結果管理
│   │   │   ├── events/           # BLoC イベント
│   │   │   │   ├── amida_event.dart        # 基底イベントクラス
│   │   │   │   └── execute_amida_event.dart # あみだくじ実行イベント
│   │   │   └── states/           # BLoC 状態
│   │   │       └── amida_result_state.dart  # あみだくじ結果状態
│   │   ├── cubit/                # シンプルな状態管理
│   │   │   └── players_cubit.dart          # プレイヤー管理
│   │   └── observer/             # デバッグ・監視
│   │       └── custom_cloc_observer.dart   # BLoCオブザーバー
│   ├── model/                    # データモデル
│   │   ├── amida_result.dart     # あみだくじ結果
│   │   ├── amidakuji.dart        # あみだくじロジック
│   │   ├── day.dart              # 曜日enum
│   │   ├── duty.dart             # 当番データ
│   │   ├── player.dart           # プレイヤーデータ
│   │   └── players.dart          # プレイヤーリスト
│   ├── service/                  # ビジネスロジック
│   │   └── amida_result_service.dart       # あみだくじサービス
│   ├── main.dart                 # アプリエントリポイント
│   └── [UI Components]           # UIウィジェット
│       ├── add_user_button.dart           # ユーザー追加ボタン
│       ├── amidakuji_result_area.dart     # 結果表示エリア
│       ├── day_button.dart                # 曜日選択ボタン
│       ├── delete_user_button.dart        # ユーザー削除ボタン
│       ├── execute_amidakuji_button.dart  # あみだくじ実行ボタン
│       ├── input_area.dart               # 入力エリア
│       ├── player_form.dart              # プレイヤーフォーム
│       ├── player_list_view.dart         # プレイヤーリスト表示
│       └── text_field.dart               # テキスト入力フィールド
├── assets/                       # 静的リソース
│   └── player/
│       └── players.json          # デフォルトプレイヤー名
├── test/                         # テストファイル
│   └── widget_test.dart
├── android/                      # Android固有設定
├── ios/                          # iOS固有設定
├── web/                          # Web固有設定
├── windows/                      # Windows固有設定
├── pubspec.yaml                  # プロジェクト設定・依存関係
└── analysis_options.yaml        # Dartアナライザー設定
```

### 各フォルダの役割と責務

#### **lib/bloc/**: 状態管理レイヤー
- **bloc/**: 複雑な非同期処理を含む状態管理（あみだくじ実行）
- **cubit/**: シンプルな状態管理（プレイヤー管理）
- **observer/**: 開発時のデバッグとロギング

#### **lib/model/**: データレイヤー
- ビジネスドメインオブジェクトの定義
- データクラスとビジネスロジック
- 不変オブジェクトの実装

#### **lib/service/**: サービスレイヤー
- ビジネスロジックの実装
- 外部APIやデータソースとの連携
- 非同期処理の管理

#### **assets/**: 静的リソース
- アプリで使用する静的ファイル
- 画像、フォント、JSONデータなど

### ファイル命名規則
- **Dartファイル**: `snake_case.dart`
- **クラス**: `PascalCase`
- **ウィジェット**: `ComponentNameWidget`形式
- **BLoC**: `FeatureBloc`形式
- **Cubit**: `FeatureCubit`形式
- **Service**: `FeatureService`形式

### プラットフォーム固有のディレクトリ

#### **android/**: Android固有設定
- Gradleビルド設定
- AndroidManifest.xml
- Kotlinサポート（MainActivity.kt）

#### **ios/**: iOS固有設定
- Xcodeプロジェクト設定
- Info.plist設定
- Swiftサポート（AppDelegate.swift）

#### **web/**: Web固有設定
- HTML/CSS/JavaScript設定
- PWA対応
- Web特有のアセット

#### **windows/**: Windows固有設定
- CMake設定
- C++ランナー
- Windows API統合

## 3. 技術スタック

### 使用フレームワーク・ライブラリ

#### **コアフレームワーク**
- **Flutter**: クロスプラットフォームUIフレームワーク
- **Dart**: プログラミング言語（SDK: ">=2.16.1 <3.0.0"）

#### **状態管理**
- **flutter_bloc: ^8.0.1**: BLoC pattern実装
  - `Bloc`: 複雑な状態管理とイベント処理
  - `Cubit`: シンプルな状態管理
  - `BlocProvider`: 依存注入
  - `BlocBuilder`: UI状態連携
  - `MultiBlocProvider`: 複数プロバイダー管理

#### **UI・デザイン**
- **Material Design**: Googleのデザインシステム
- **cupertino_icons: ^1.0.2**: iOSスタイルアイコン

#### **開発・テスト**
- **flutter_lints: ^1.0.0**: Dartコード品質チェック
- **flutter_test**: テストフレームワーク

### 依存関係の詳細

#### **プロダクション依存関係**
```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2
  flutter_bloc: ^8.0.1
```

#### **開発依存関係**
```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^1.0.0
```

### 開発環境・ビルドツール

#### **開発環境**
- **Flutter SDK**: 2.16.1以上
- **Dart SDK**: Flutter SDKに含まれる
- **分析ツール**: `analysis_options.yaml`でカスタマイズ

#### **ビルドツール**
- **Android**: Gradle
- **iOS**: Xcode
- **Web**: dart2js
- **Windows**: CMake + MSVC

#### **開発コマンド**
```bash
flutter pub get          # 依存関係取得
flutter analyze          # 静的解析
flutter test            # テスト実行
flutter run             # デバッグ実行
flutter build [platform] # リリースビルド
```

### デプロイメント方法

#### **各プラットフォーム向けビルド**
```bash
# Android
flutter build apk --release
flutter build appbundle --release

# iOS
flutter build ios --release

# Web
flutter build web --release

# Windows
flutter build windows --release
```

## 4. コーディング規約

### 命名規則

#### **ファイル・ディレクトリ命名**
- **Dartファイル**: `snake_case.dart`
  - 例: `amida_result_bloc.dart`, `players_cubit.dart`
- **ディレクトリ**: `snake_case`
  - 例: `bloc/`, `model/`, `service/`

#### **クラス・型命名**
- **クラス**: `PascalCase`
  - 例: `AmidaResultBloc`, `PlayersCubit`, `AmidakujiResultAreaWidget`
- **抽象クラス**: `PascalCase`
  - 例: `AmidaResultState`, `AmidaEvent`
- **Enum**: `PascalCase`
  - 例: `Day` (Monday, Tuesday, ...)

#### **変数・メソッド命名**
- **変数**: `camelCase`
  - 例: `amidaResult`, `targetDay`, `updateddHolidays`
- **メソッド**: `camelCase`
  - 例: `executeAmidakuji()`, `toggleHoliday()`, `addNewPlayer()`
- **プライベートメンバー**: `_camelCase`
  - 例: `_loadPlayersFromJson()`, `_executeAmida()`

#### **定数命名**
- **定数**: `camelCase`または`UPPER_SNAKE_CASE`
  - 例: `limitLoopCounterValue`, `days`

### クラス・コンポーネント命名パターン

#### **UIコンポーネント**
- **Widget**: `ComponentNameWidget`
  - 例: `ExecuteAmidakujiButtonWidget`, `DayButtonWidget`, `AmidakujiResultAreaWidget`
- **Stateless Widget**: `StatelessWidget`を継承
- **Stateful Widget**: `StatefulWidget`を継承

#### **状態管理**
- **BLoC**: `FeatureBloc`
  - 例: `AmidaResultBloc`
- **Cubit**: `FeatureCubit`
  - 例: `PlayersCubit`
- **State**: `FeatureState`
  - 例: `AmidaResultState`（抽象クラス）
  - 具象クラス: `AmidaResultInitialState`, `AmidaResultLoadingState`
- **Event**: `FeatureEvent`
  - 例: `AmidaEvent`（抽象クラス）
  - 具象クラス: `ExecuteAmidaEvent`

#### **ビジネスロジック**
- **Service**: `FeatureService`
  - 例: `AmidaResultService`
- **Model**: `PascalCase`
  - 例: `Player`, `Amidakuji`, `AmidaResult`

### アーキテクチャパターンの適用方法

#### **BLoC Pattern**
```dart
// BLoC定義
class AmidaResultBloc extends Bloc<AmidaEvent, AmidaResultState> {
  final AmidaResultService service;
  
  AmidaResultBloc(this.service) : super(AmidaResultInitialState()) {
    on<ExecuteAmidaEvent>((event, emit) async {
      emit(AmidaResultLoadingState());
      try {
        final result = await service.executeAmidakuji(event.players);
        emit(AmidaResultLoadedState(result));
      } catch (e) {
        emit(AmidaResultErrorState());
      }
    });
  }
}

// UI連携
BlocBuilder<AmidaResultBloc, AmidaResultState>(
  builder: (context, state) {
    if (state is AmidaResultLoadingState) {
      return CircularProgressIndicator();
    }
    // 状態に応じたUI描画
  }
)
```

#### **Cubit Pattern（シンプルな状態管理）**
```dart
class PlayersCubit extends Cubit<Players> {
  PlayersCubit() : super(Players([]));
  
  void addNewPlayer(String name) => emit(state.addNewPlayer(name));
  void deletePlayer(String name) => emit(state.deletePlayer(name));
}
```

### 状態管理の方針

#### **BLoC vs Cubit使い分け**
- **BLoC**: 複雑な非同期処理、多数のイベント処理
  - 例: あみだくじ実行（非同期処理、エラーハンドリング）
- **Cubit**: シンプルな状態変化
  - 例: プレイヤー管理（CRUD操作）

#### **状態設計原則**
- **不変性**: 状態オブジェクトは不変
- **コピー更新**: 状態変更時は新しいオブジェクトを生成
- **状態分割**: 機能ごとに状態を分割

### UIコンポーネントの設計原則

#### **Widget分割原則**
- **単一責任**: 一つのWidgetは一つの責任
- **再利用性**: 汎用的なコンポーネントは再利用可能に設計
- **コンポジション**: 複雑なUIは小さなWidgetの組み合わせ

#### **Widget構成パターン**
```dart
// メインWidget
class MyHomePage extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => PlayersCubit()),
          BlocProvider(create: (_) => AmidaResultBloc(AmidaResultService())),
        ],
        child: Column(
          children: [
            // コンポーネント分割
            PlayerListView(players),
            ExecuteAmidakujiButtonWidget(),
            AmidakujiResultAreaWidget(state),
          ],
        ),
      ),
    );
  }
}
```

### エラーハンドリングの方針

#### **例外処理パターン**
```dart
// Service層での例外処理
Future<AmidaResult> executeAmidakuji(Players players) {
  AmidaResult result = Amidakuji(players).executeAmidakuji();
  
  if (result.isFailed) {
    throw Exception("エラーが発生しました");
  }
  
  return Future.delayed(Duration(seconds: 1)).then((value) => result);
}

// BLoC層での例外処理
on<ExecuteAmidaEvent>((event, emit) async {
  emit(AmidaResultLoadingState());
  try {
    AmidaResult result = await amidaResultService.executeAmidakuji(event.players);
    emit(AmidaResultLoadedState(result));
  } catch (e) {
    emit(AmidaResultErrorState());
  }
});
```

#### **UI層でのエラー表示**
```dart
if (state is AmidaResultErrorState) {
  return const Text(
    "エラーが発生しました😇",
    style: TextStyle(
      fontSize: 20, 
      fontWeight: FontWeight.bold, 
      color: Colors.red
    )
  );
}
```

### 日本語対応とローカライゼーション

#### **日本語文字列の扱い**
- **UI文字列**: 直接日本語を使用
- **メソッド名**: 必要に応じて日本語を含む
  - 例: `damenahiString()` （「ダメな日」の意味）
- **コメント**: 日本語でのコメント記述OK

#### **国際化対応準備**
- 将来的な多言語対応を考慮した設計
- 文字列の外部化を検討

### Git・プロジェクト管理規約

#### **コミットメッセージ**
- 日本語または英語
- 変更内容を明確に記述

#### **ブランチ戦略**
- feature/機能名
- bugfix/問題名
- main/masterブランチでの開発

この規約に従うことで、一貫性のあるコードベースを維持し、チーム開発の効率性を向上させることができます。
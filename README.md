# 株式会社ゆめみ Flutter 研修

実務に近いかたちでアプリ開発を行いながら、Flutter でのアプリ開発の基礎復習、実務スキルを身に付けるための研修です。

## 概要

天気予報アプリを開発していただきます。

## 研修の流れ

### 課題の進め方

1. 課題用のブランチを切って実施
   `session/{#}`
2. 完了したら Pull Request を作成し、レビュー依頼
   `main <-- session/{#}`
3. 承認されたらマージ
4. 次の課題を実施

全ての課題をクリアしたら修了です！

### レビュー待ちのとき

レビュー待ちの時は次の課題に先行着手しましょう。
`git rebase` コマンドを使ってみましょう。[^1]

Session1 がレビュー待ちの場合...

1. `session/1` ブランチから `session/2` を切る
2. Session2 を進める
3. `session/1` のマージ後、`session/2` を `main` で `rebase` する

[^1]: このようなケースで `rebase` コマンドを使うことが必ずしも正しいとは限りません。
どのような方法をとるかはチームで議論するべきと考えます。
ただ、この研修は「`rebase` コマンドを使ってみる」ことも研修の一部としています。

## 課題

### Session

- [Session0-Setup]
- [Session1-Layout]
- [Session2-API]
- [Session3-Lifecycle]
- [Session4-Mixin]
- [Session5-Error]
- [Session6-JSON]
- [Session7-Serialization]
- [Session8-StateManagement]
- [Session9-UnitTest]
- [Session10-WidgetTest]
- [Session11-ThreadBlock]

<!-- Links -->

[templates]: .github/templates

[Session0-Setup]: docs/sessions/setup.md

[Session1-Layout]: docs/sessions/layout.md

[Session2-API]: docs/sessions/api.md

[Session3-Lifecycle]: docs/sessions/lifecycle.md

[Session4-Mixin]: docs/sessions/mixin.md

[Session5-Error]: docs/sessions/error.md

[Session6-JSON]: docs/sessions/json.md

[Session7-Serialization]: docs/sessions/serialization.md

[Session8-StateManagement]: docs/sessions/state_management.md

[Session9-UnitTest]: docs/sessions/unit_test.md

[Session10-WidgetTest]: docs/sessions/widget_test.md

[Session11-ThreadBlock]: docs/sessions/thread_block.md

[貢献ガイド]: docs/contributing/CONTRIBUTING.md

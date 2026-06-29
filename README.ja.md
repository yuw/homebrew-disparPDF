# homebrew-disparPDF

[disparPDF](https://github.com/yuw/disparPDF)のHomebrew tapです。
disparPDFはPDFの差分を比較するツールです。

## インストール

```sh
brew tap yuw/disparPDF
brew trust yuw/disparPDF
brew install yuw/disparPDF/disparPDF
```

インストール後、`/Applications`へのコピーを手動で行います：

```sh
cp -r /opt/homebrew/opt/disparpdf/disparPDF.app /Applications/
codesign --force --sign - /Applications/disparPDF.app/Contents/MacOS/disparPDF
```

## フォーミュラ一覧

| フォーミュラ | 説明 |
|---|---|
| `disparPDF` | PDF比較ツール（GUI・CLI） |
| `poppler-qt6` | Poppler Qt6バインディング（必須依存） |

## 詳細

詳しくは[disparPDFリポジトリ](https://github.com/yuw/disparPDF)を参照してください。

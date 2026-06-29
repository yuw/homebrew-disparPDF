# homebrew-disparPDF

Homebrew tap for [disparPDF](https://github.com/yuw/disparPDF) — a PDF comparison tool.

## Install

```sh
brew tap yuw/disparPDF
brew trust yuw/disparPDF
brew install yuw/disparPDF/disparPDF
```

After installation, copy to `/Applications`:

```sh
cp -r /opt/homebrew/opt/disparpdf/disparPDF.app /Applications/
codesign --force --sign - /Applications/disparPDF.app/Contents/MacOS/disparPDF
```

## Formulae

| Formula | Description |
|---|---|
| `disparPDF` | PDF comparison tool (GUI + CLI) |
| `poppler-qt6` | Qt6 bindings for Poppler (required dependency) |

## More information

See the [disparPDF repository](https://github.com/yuw/disparPDF) for full documentation.

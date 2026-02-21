# Portfolio Simulator Pro

円評価・マルチ比較・ベイズ最適化・リバランス履歴・全期間ヒートマップ対応のポートフォリオシミュレーター。

## 🌐 GitHub Pages での使い方（推奨）

このリポジトリをフォーク or クローンして GitHub Pages を有効にすると、  
`data/` フォルダに置いた CSV が**毎回インポート不要で自動読み込み**されます。

### ファイル構成

```
portfolio-simulator/
├── index.html          ← シミュレーター本体（そのまま使用）
├── data/
│   ├── topix.csv       ← TOPIX 日次データ
│   ├── sp500.csv       ← S&P 500 日次データ（USD建て）
│   ├── gold.csv        ← 金スポット価格 日次データ（USD建て）
│   ├── usdjpy.csv      ← USD/JPY 為替レート 日次データ
│   └── jgb.csv         ← 日本国債1年利回り（任意）
└── README.md
```

### CSV フォーマット

**共通形式（ヘッダー不要）:**
```
日付,数値
2000-01-04,1722.56
2000-01-05,1708.33
...
```

**対応日付フォーマット:**
- `YYYY-MM-DD`（推奨）
- `YYYY/MM/DD`
- `MM/DD/YYYY`（Yahoo Finance形式）

**日本国債のみ異なる（数値=1年利回り%）:**
```
2000-01-04,0.19
2001-01-04,0.25
...
```
※ 毎日記録でなくても可。直近の記録値が補間されます。

---

## 📥 データ取得先

| データ | 推奨取得先 | ティッカー/URL |
|--------|-----------|---------------|
| TOPIX | [Stooq.com](https://stooq.com/q/d/?s=^tpx) | `^tpx` |
| S&P 500 | [Stooq.com](https://stooq.com/q/d/?s=^spx) | `^spx` |
| Gold (XAU/USD) | [Stooq.com](https://stooq.com/q/d/?s=xauusd) | `xauusd` |
| USD/JPY | [Stooq.com](https://stooq.com/q/d/?s=usdjpy) | `usdjpy` |
| 日本国債1年利回り | [日本銀行](https://www.stat-search.boj.or.jp/) / [Stooq](https://stooq.com/q/d/?s=0%25jpy) | — |

> **Stooqのダウンロード形式について:**  
> Stooqは `Date,Open,High,Low,Close,Volume` の6列CSVをダウンロードします。  
> シミュレーターは **1列目=日付、2列目=値** を読むため、そのまま使えます（Open値が使われます）。  
> 終値を使いたい場合はExcel等で `Date,Close` の2列に加工してください。

---

## 🚀 GitHub Pages の有効化手順

1. このリポジトリを GitHub にプッシュ
2. リポジトリの **Settings → Pages** を開く
3. **Source** を `Deploy from a branch` に設定
4. **Branch** を `main`、フォルダを `/ (root)` に設定して **Save**
5. 数分後に `https://[ユーザー名].github.io/[リポジトリ名]/` でアクセス可能

---

## 🔄 データ更新方法

`data/` フォルダ内の CSV を新しいデータに差し替えて `git push` するだけで、  
次回アクセス時から最新データが自動で読み込まれます。

---

## 💻 ローカルでの使い方

ファイルをそのままブラウザで開く（`file://` プロトコル）場合、  
セキュリティ制限により自動読み込みは動作しません。  
その場合は従来通り手動でCSVをインポートしてください。

**ローカルでも自動読み込みを使う場合は、簡易サーバーを起動してください:**

```bash
# Python 3
python3 -m http.server 8080
# → http://localhost:8080 でアクセス

# Node.js (npx)
npx serve .
# → http://localhost:3000 でアクセス
```

---

## 📊 機能一覧

- **マニュアルモード**: TOPIX / S&P500 / Gold / 日本国債 の配分を自由に設定
- **複数ポートフォリオ比較**: 最大8配分を同時表示・成績比較テーブル
- **元本割れ期間表示**: 全期間 / 元本割れ期間のみ を切り替え
- **リバランス機能**: 乖離±X% / 半年ごと / 1年ごとの3モード、履歴ログ付き
- **ベイズ最適化**: Calmar / Sharpe / CAGR で最適配分を自動探索
- **全期間ヒートマップ**: 各月始まりを開始日とした成績分布を月×年マトリクスで可視化

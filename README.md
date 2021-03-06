<h1>My Song</h1>
<p>自分が投稿した歌に対しインストラクターの方がアドバイスをしてくれる歌投稿サイトです。</p>

<h3>リンク</h3>
<p>http://mysong.work/</p>
<img width="1415" alt="スクリーンショット 2020-02-15 19 00 21" src="https://user-images.githubusercontent.com/56349921/74586237-f8204600-5028-11ea-8bb6-419353bdd142.png">

<ul>
  <li>新規登録ページにゲストログインボタンが用意してありますので、ご自由にお使いください</li>
  <li>ゲストログインした場合ユーザー情報の編集はできませんので、ご了承ください ※有料会員へのアップグレードは可</li>
  <li>決済機能では(4242 4242 4242 4242)がテスト用カード番号になっておりますので、ご利用下さい</li>
  <li>ゲストユーザーでログインした場合すでに会員ステータスが有料会員になっている可能性がございます。
    その場合、決済機能の検証にはユーザー情報ページから解約するか新規登録でユーザーを登録してご利用ください。</li>
  <li>アップロード機能をテストする際にはサンプルファイルを用意してありますので、ご自由にお使い下さい</li>
</ul>
  <p>mp3ファイル https://d.kuku.lu/a2fd036014</p>
  <p>mp4ファイル https://d.kuku.lu/dd7b244458</p>

<h4>ログインなしで利用できる機能</h4>
  <p>・投稿された歌の閲覧</p>
<h4>ログイン時の利用できる機能</h4>
  <p>・mp3ファイルの音声ファイル投稿</p>
<h4>有料会員の利用できる機能</h4>
  <p>・トレーニング投稿</p>
  
<h2>使用技術</h2>
<h4>バックエンド</h4>
<ul>
  <li>Ruby2.6.3</li>
  <li>Rails5.2.2</li>
  <li>Docker</li>
  <li>Nginx</li>
  <li>Rspec</li>
  <li>CircleCI</li>
  <li>AWS(EC2,ECS,ALB,RDS for MySQL,S3,VPC,Route53)</li>
</ul>
<h4>フロント</h4>
<ul>
  <li>scss</li>
  <li>bootstrap</li>
  <li>jquery</li>
</ul>

<h2>機能一覧</h2>
<ul>
  <li>CircleCIを用いたCI/CD機能</li>
  <li>Rspecによる自動テスト</li>
  <li>Rubocopによる自動コード解析</li>
  <li>ユーザー登録・ユーザーログイン機能（devise）</li>
  <li>音声・動画・画像各種投稿機能（CarrierWave）</li>
  <li>いいね機能（非同期）</li>
  <li>フォロー機能（非同期）</li>
  <li>コメント機能（非同期）</li>
  <li>ページネーション機能（Kaminari）</li>
  <li>検索機能</li>
  <li>定期課金機能(PAY.JP API)</li>
</ul>
<h2>アーキテクチャ図</h2>
<img src="https://user-images.githubusercontent.com/56349921/76155836-37781900-6135-11ea-824b-f4d84f4a9854.png">

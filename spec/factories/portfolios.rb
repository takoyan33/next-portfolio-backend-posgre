FactoryBot.define do
  factory :portfolio do
    name { "Easy To Do" }
    date { "2024.4.12" }
    tag { ["Vue.js", "Nuxt3", "Firestore"] }
    topImg { "/images/portfolio/portfolio_top1.png" }
    front_url { "https://vuejs-app-front.web.app/" }
    back_url { "" }
    front_github { "https://github.com/takoyan33/nuxt3-firestore-front" }
    back_github { "" }
    color { "portfolio__tag--color3" }
    about do
      "<p>Vue.jsやNuxt3について学びたく、Todoが投稿、閲覧できるサイトを作りました。<br>データベースはFireStoreを使っています。</p>"
    end
    aboutImg { "/images/portfolio/portfolio_about1.png" }
    function do
      "<p>機能としては</p><ul><li>ログイン、ログアウト機能</li><li>Todoの登録・編集・削除機能</li><li>Todoの詳細画面、カレンダー表示</li><li>プロフィール画面</li></ul><p>があります</p>"
    end
    functionImg { "/images/portfolio/portfolio_function1.png" }
    appeal do
      "<p>1つ目は、FireStoreのバッチ処理を用いてTodoの複数投稿を実装しています。<br>2つ目は、Piniaの状態管理を使って、ダークモードの状態管理やログイン状態の管理をしています。<br>3つ目は、Testing Libraryでの単体テストや、Playwirghtを用いて、E2Eテストを実装して、ログイン処理や投稿処理のチェックをしています</p>"
    end
    appealImg { "/images/portfolio/portfolio_appeal1.png" }
    front_skill { ["Nuxt 3", "Vue.js", "Pinia", "TypeScript", "ESLint, Prettier", "Playwirght"] }
    back_skill { ["Firestore"] }
    infra_skill { ["firebase hosting"] }
    time { "2ヶ月" }
    prev_title { nil }
    prev_article_id { nil }
    next_title { "Manga Study" }
    next_article_id { "2" }
    created_at { "2024-12-30T05:55:21.258Z" }
    updated_at { "2024-12-30T05:55:21.258Z" }
  end
end

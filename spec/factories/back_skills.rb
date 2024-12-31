FactoryBot.define do
  factory :back_skill do
    name { "WordPress" }
    rank { "★★★" }
    tag { "経験年数：1年" }
    about { "ホームページ制作などで使用。ブログ機能やカスタムフィールドなども実装可能。WordPressAPIの実装経験有り" }
    icon { "/images/skill/wordpress.svg" }
    created_at { "2024-12-30T05:55:21.301Z" }
    updated_at { "2024-12-30T05:55:21.301Z" }
  end
end
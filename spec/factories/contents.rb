FactoryBot.define do
  factory :content do
    title { Faker::Book.title }
    #published_date { Faker::Time.between(DateTime.now - 1, DateTime.now)   }
    published_date { Time.now + 3 }
    author { Faker::Book.author }
    summary { Faker::Book.title }
    content { Faker::Book.title}
    status { "published" }
  end
end

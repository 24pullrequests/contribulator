FactoryGirl.define do
  factory :issue do
    sequence :github_id do |n|
      "whatever-#{n}"
    end

    sequence :url do |n|
      "http://somewhere-#{n}.com"
    end

    sequence :title do |n|
      "#{Faker::Lorem.word} #{n}"
    end

    project
  end

  factory :project do
    sequence :name do |n|
      "#{Faker::Lorem.word}-#{n}"
    end

    sequence :owner do |n|
      "#{Faker::Lorem.word}-#{n}"
    end

    score 20
  end
end

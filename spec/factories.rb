FactoryGirl.define do  factory :issue do
    
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

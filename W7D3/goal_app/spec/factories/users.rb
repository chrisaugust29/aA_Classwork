FactoryBot.define do
  factory :user do
    username {Faker::Esport.player }
    email {Faker::Internet.email }
    password {'password'}

    factory :esport do 
      username {'On Bush'}
    end  
  end
end

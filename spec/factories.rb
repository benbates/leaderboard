FactoryGirl.define do
  factory :player do
    name     "Ben Bates"
  end
  
  factory :game do
    game_type_id "1"
  end
  
  factory :result do
    content "Lorem ipsum"
    player
    
  end
end
FactoryGirl.define do
  factory :shift do
    title 'my first availability'
    content 'content for my first availability'
    start_date DateTime.new(2014, 12, 20)
    end_date DateTime.new(2014, 12, 30)
    slot_type 'available'
  end

  trait :available do
    slot_type 'available'
  end

  trait :seek do
    slot_type 'seek'
  end
end

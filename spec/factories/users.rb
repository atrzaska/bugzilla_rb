FactoryGirl.define do
  factory :user do
    before(:create) do |user|
      user.skip_confirmation!
    end

    sequence :email do |n|
      "demo#{n}@bugzilla.com"
    end

    password 'password'
  end
end

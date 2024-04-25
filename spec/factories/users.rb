FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { 'test@test.com' }
    password              { 'aaa000' }
    password_confirmation { password }
    last_name             { '山田' }
    first_name            { '太郎' }
    kana_last_name        { 'ヤマダ' }
    kana_first_name       { 'タロウ' }
    birthday              { '2000,1,1' }
  end
end

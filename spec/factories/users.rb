FactoryGirl.define do
  factory :user do
    super_user false
    allow_login false
    agent nil
    ip ""
    inviter_id 1
    invitee_count 1
    max_depth 1
    slug "MyString"
    screen_name "MyString"
    name "MyString"
    email "MyString"
    phone "MyString"
    email_confirmed false
    phone_confirmed false
    allow_mail false
    password ""
    last_seen "2017-02-03 00:18:26"
    fractals_count 1
    follower_count 1
    followee_count 1
    hide_profile false
    image "MyString"
  end
end

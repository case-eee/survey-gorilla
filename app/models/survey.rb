class Survey < ActiveRecord::Base
  belongs_to :author, class_name: "User", foreign_key: :user_id

  has_many :surveytakers
  has_many :responses
  has_many :users, through: :surveytakers

  has_many :questions
end

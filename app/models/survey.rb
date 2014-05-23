class Survey < ActiveRecord::Base
  belongs_to :user

  has_many :surveytakers
  has_many :users, through: :surveytakers

  has_many :questions
end

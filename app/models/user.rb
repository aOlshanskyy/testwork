# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments

  has_many :groups
  has_many :articles
  has_many :events
  has_many :enters
  has_many :candidates
  has_one_attached :avatar
end

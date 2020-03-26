# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :comments

  has_many :groups
  has_many :articles
  has_many :events
  has_many :enters
  has_many :candidates
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: '/images/Default2.png'
  validates_attachment_content_type :avatar, content_type: %r{\Aimage/.*\z}
end

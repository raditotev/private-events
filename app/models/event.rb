class Event < ActiveRecord::Base
  belongs_to :host, class_name: "User"
  has_many :invitations, dependent: :destroy
  has_many :guests, through: :invitations, source: :guest
end

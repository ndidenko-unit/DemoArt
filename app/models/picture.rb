class Picture < ApplicationRecord

  mount_uploader :avatar, AvatarUploader
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_avatar

  has_many :tags
  accepts_nested_attributes_for :tags
  def crop_avatar
    avatar.recreate_versions! if crop_x.present?
  end
  
end

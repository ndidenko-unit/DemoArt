class Tag < ApplicationRecord
  validates :x, :y, :h, :w, :name, :text, :link, :picture_id, presence: true
  validates_length_of :text, minimum: 100, allow_blank: true

  validate :sharp_in_name?, on: [:create]
  mount_uploader :avatar, AvatarUploader
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_avatar

  belongs_to :picture

  def crop_avatar
    avatar.recreate_versions! if crop_x.present?
  end

  private

  def sharp_in_name?
      errors.add(:base, 'First char must be #') unless '#'.include?(name[0])
  end
end

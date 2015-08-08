class Recipe < ActiveRecord::Base
  belongs_to :user

  validates :name, :description, :image, presence: true

  has_attached_file :image, styles: { :medium => "400x400#", :thumb => "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end

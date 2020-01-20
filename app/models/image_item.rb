class ImageItem < ApplicationRecord
  mount_uploader :repimg, ImageUploader

  belongs_to :user, optional:true
  belongs_to :category, optional:true
  #has_one :order
  has_many :reviews, as: :reviewable
  has_many :line_items, dependent: :nullify

  scope :free_images, -> {where(price: 0)}
  scope :pay_images, -> {where("price > 0")}
  scope :sort_images, -> (sort, align) {
    ["price is", "price >"].include?(sort) ? where("#{sort} #{align}") : order("#{sort} #{align}") 
  }

  has_attached_file :video, :path => ":rails_root/public/video/:id/:filename", :url => "/video/:id/:filename", :styles => { :medium => { :geometry => "640x480", :format => 'mp4' }, :large => { :geometry => "1024x576", :format => 'mp4' }, }, :processors => [:ffmpeg, :qtfaststart]
  validates_attachment_content_type :video, content_type: /\Avideo\/.*\Z/
end

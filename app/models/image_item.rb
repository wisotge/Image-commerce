class ImageItem < ApplicationRecord
  mount_uploader :repimg, ImageUploader

  belongs_to :user, optional:true
  has_many :reviews, as: :reviewable

  has_attached_file :video, :path => ":rails_root/public/video/:id/:filename", :url => "/video/:id/:filename", :styles => { :medium => { :geometry => "640x480", :format => 'mp4' }, :large => { :geometry => "1024x576", :format => 'mp4' }, }, :processors => [:ffmpeg, :qtfaststart]
  validates_attachment_content_type :video, content_type: /\Avideo\/.*\Z/
end

class Project < ApplicationRecord
  belongs_to :user
  has_many :workshops

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png", dependent: :destroy
  
  has_attached_file :video, styles: {
    :medium => {
      :geometry => "640x480",
      :format => 'mp4'
    },
    :thumb => { :geometry => "160x120", :format => 'jpeg', :time => 10}
  }, :processors => [:transcoder], dependent: :destroy
  
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  
  validates_attachment_content_type :video, content_type: /\Avideo\/.*\Z/
end

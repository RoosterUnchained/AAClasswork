class Artwork < ApplicationRecord


  validates :title, :img_url, :artist_id, presence: true
  validates :title, uniqueness: { scope: :artist_id, message: "Must have unique title for each artwork from an artist." } 

  belongs_to :artist,
    foreign_key: :artist_id, 
    class_name: :User
     
  has_many :shares,
    foreign_key: :artwork_id,
    class_name: 'ArtworkShare'

  has_many :shared_viewers,
    through: :shares,
    source: :viewer
  
  has_many :comments,  
    foreign_key: :artwork_id,
    class_name: :Comment,
    dependent: :destroy 
    
  def self.artworks_by_user_id(user_id)
    Artwork
      .left_outer_joins(:shares)
      .where("(artworks.artist_id = #{user_id}) OR (artwork_shares.viewer_id = #{user_id})")
      .distinct 
  end

end

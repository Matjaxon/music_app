class Track < ActiveRecord::Base
  validates :title, :album_id, :track_type, presence: true

  belongs_to :album
  has_one :band, through: :album
  has_many :notes

end

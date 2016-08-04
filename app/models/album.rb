class Album < ActiveRecord::Base

  validates :title, :band_id, :recording_type, presence: true

  belongs_to :band
  has_many :tracks, dependent: :destroy



end

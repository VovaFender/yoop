class Track < ActiveRecord::Base
  attr_accessible :title, :lyrics, :authors, :url, :artist_ids
  has_and_belongs_to_many :artists, :join_table => 'artists_tracks'

  validates_presence_of :title, :on => :create, :message => "cannot be blank"
  validates_presence_of :authors, :on => :create, :message => "cannot be blank"
  validates_presence_of :artists, :on => :create, :message => "must be selected"

end

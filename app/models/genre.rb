require_relative "slug.rb"

class Genre < ActiveRecord::Base
  include Slugger
  extend SelfSlugger
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs
end

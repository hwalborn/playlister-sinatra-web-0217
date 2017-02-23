require_relative "slug.rb"

class Song < ActiveRecord::Base
  include Slugger
  extend SelfSlugger
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
end

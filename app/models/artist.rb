require_relative "slug.rb"

class Artist < ActiveRecord::Base
  include Slugger
  extend SelfSlugger
  has_many :songs
  has_many :genres, through: :songs
end

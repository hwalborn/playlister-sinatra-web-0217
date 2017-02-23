module Slugger
  def slug
    self.name.gsub(" ", "-").downcase
  end
end

module SelfSlugger

  def find_by_slug(slug)
    find_by(name: real_title(slug.gsub("-", " ")))
  end

  def real_title(string)
    small_words = ["and", "a", "to", "the", "with"]
    string.split(" ").map do |word|
      if !(small_words.include?(word))
        word.capitalize
      else
        word
      end
    end.join(" ")
  end
end

class Picture < ApplicationRecord

  validates :artist, presence: true
  validates :title, length: { minimum: 3, maximum: 20 }
  validates :url, uniqueness: true

  def self.newest_first
    Picture.order("created_at DESC")
  end

  def self.most_recent_five
    Picture.newest_first.limit(5)
  end

  def self.created_before(time)
    Picture.where("created_at < ?", time)
  end

  def self.created_at(time)
    Picture.where("created_at < ?", Time.now - 1.month)
  end

  def self.pictures_created_in_year(year)
    Picture.where("created_at >= ? AND created_at < ?", "#{year}-01-01 00:00:00", "#{year + 1}-01-01 00:00:00")
  end

end

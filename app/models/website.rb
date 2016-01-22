# == Schema Information
#
# Table name: websites
#
#  id         :integer          not null, primary key
#  url        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Website < ActiveRecord::Base
  has_many :photos

  # def paese_img_src
  #   # uri = 
  #   protocol_domain = %Q(#{uri.scheme}//#{uri.host})
  #   content = open(link).read
  #   doc = Nokogiri::HTML(content).read
  #   photos_doc = doc.search("img")
  #   images = []

  #   photos_doc.each do |i|
  #     images << i.attr('src')
  #   end

  #   pics = images.map do |url|
  #     if url.include?("http")
  #       url
  #     elsif url =~ /^\/\//
  #       url.sub!(/^\/\//, "http://")
  #     else
  #       protocol_domain + url
  #   end

  #   website = Website.find_by(url: link)
  #   pics.each do |pic|
  #     website.photos.create!(image: pic)
  #   end
  # end  
end

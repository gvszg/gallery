class WebsitesController < ApplicationController
  def index
    if params[:url]
      @website = Website.find_by(url: params[:url])
      if @website
        @photos = @website.photos
      else
        @website = Website.create!(url: params[:url])
        @photos = create_photos_from_url(@website)        
      end    
    end
  end

  private

  def create_photos_from_url(website)
    uri = URI(website.url)
    protocol_domain = %Q(#{uri.scheme}://#{uri.host})
    content = Net::HTTP.get(uri)
    doc = Nokogiri::HTML(content)
    photos_doc = doc.css("img")
    images = []
    
    photos_doc.each do |i|
      images << i.attr('src')
    end
    
    pics = images.map do |url|
      if url.include?("http")
        url
      elsif url =~ /^\/\//
        url.sub!(/^\/\//, "http://")
      else
        protocol_domain + url
      end
    end
    

    pics.each do |pic|
      website.photos.create!(image: pic)
    end

    return website.photos
  end
end
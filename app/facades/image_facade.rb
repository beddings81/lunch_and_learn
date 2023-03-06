class ImageFacade 
  def self.get_images(country)
    images = PexelService.get_images(country)
    images.map { |image| Image.new(image)} unless images.nil?
  end
end
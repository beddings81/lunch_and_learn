class LearningResourceFacade
  def self.by_country(country, video, images)
    LearningResource.new(country, video, images)
  end
end
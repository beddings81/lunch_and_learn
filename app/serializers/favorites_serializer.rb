class FavoritesSerializer
  def self.successfully_created
    {
      success: "Favorite added successfully"
    }
  end

  def self.failed_to_created
    {
      failure: "No user with that api key was found"
    }
  end
end
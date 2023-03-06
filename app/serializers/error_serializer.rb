class ErrorSerializer
  def self.no_recipes
    { 
      data: [] 
    }
  end

  def self.invalid_record(error)
    { 
      error: [ 
        { 
          title: error.message,
          status: 400 
        }
      ]
    }
  end

end
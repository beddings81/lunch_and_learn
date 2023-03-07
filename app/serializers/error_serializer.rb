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

  def self.failed_to_create
    { 
      error: [ 
        { 
          title: "No user with that api key was found",
          status: 400 
        }
      ]
    }
  end

end
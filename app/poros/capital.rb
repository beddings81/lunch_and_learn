class Capital
  attr_reader :name, :lat, :lon

  def initialize(data)
    return unless data.present?
    @name = data[:capital][0]
    @lat = data[:capitalInfo][:latlng][0]
    @lon = data[:capitalInfo][:latlng][1]
  end
end
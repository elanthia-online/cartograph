class Map
  attr_reader :id
  attr_accessor :title, :description, :paths, :location, :climate, :terrain, :wayto, :timeto, :image, :image_coords, :tags, :check_location, :unique_loot
  def initialize(id, title, description, paths, location=nil, climate=nil, terrain=nil, wayto={}, timeto={}, image=nil, image_coords=nil, tags=[], check_location=nil, unique_loot=nil)
    @id, @title, @description, @paths, @location, @climate, @terrain, @wayto, @timeto, @image, @image_coords, @tags, @check_location, @unique_loot = id, title, description, paths, location, climate, terrain, wayto, timeto, image, image_coords, tags, check_location, unique_loot
  end

  def attributes
    self.instance_variables.map do |attribute|
      key = attribute.to_s.gsub('@','')
      [key, self.instance_variable_get(attribute)]
    end.to_h
  end

  def has_wayto_string_proc?
    wayto.values.any? {|way| way.is_a?(StringProc)}
  end

  def has_timeto_string_proc?
    timeto.values.any? {|estimate| estimate.is_a?(StringProc)}
  end

  def to_json(*args)
    attributes.to_json(*args)
  end
end

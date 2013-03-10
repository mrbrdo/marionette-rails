class BackboneRoutes
  def self.instance(&block)
    @instance ||= BackboneRoutes.new
  end

  def self.draw(map_to, &block)
    BackboneRoutes.instance.map_to = map_to
    BackboneRoutes.instance.instance_eval(&block) unless block.nil?
  end

  attr_reader :routes
  attr_accessor :map_to

  def initialize
    @routes = Hash.new
  end

  def match(mapping)
    path, backbone_handler = mapping.find { |name, value| name.is_a?(String) }
    routes[path] = backbone_handler.to_s
    map_to = @map_to
    Rails.application.routes.draw do
      get path => map_to
    end
  end

  def root(mapping)
    routes[""] = mapping[:to]
    map_to = @map_to
    Rails.application.routes.draw do
      root to: map_to
    end
  end

  def to_routes
    bb_routes = routes.each_pair.map do |path, handler|
      "'#{path}': '#{handler}'"
    end
    "{ " + bb_routes.join(",") + " };"
  end
end

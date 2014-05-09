# Encoding : UTF-8
require_relative "node"

class NodeList

  def initialize(nodes = [])
    @collection = {}
    
    nodes.each do |node|
      @collection[node['id']] = Node.new(node)
    end
  end

  def get(node_id) 
    return @collection[node_id]
  end

end


class NodeList
  attr_reader :first

  def initialize(nodes = [])
    @collection = {}
    
    nodes.each do |node|
      @collection[node['id']] = Node.new(node)
      if node['parent_id'] == 0
        @first_id = node['id']
      end
    end
  end

  def get(node_id) 
    return @collection[node_id]
  end

  def first
    return get(@first_id)
  end

end

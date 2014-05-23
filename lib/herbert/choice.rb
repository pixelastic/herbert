
class Choice
  attr_accessor :id, :next_node_id, :content

  def initialize(choice = {})
    @id = choice['id']
    @next_node_id = choice['next_node_id']
    @content = choice['content']
  end
end


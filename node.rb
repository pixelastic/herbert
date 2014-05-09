# Encoding: UTF-8

class Node
  attr_accessor :id, :content, :is_final, :parent_id

  def initialize(node = {})
    @id = node['id']
    @content = node['content']
    @is_finale = node['is_final']
    @parent_id = node['parent_id']
  end
end

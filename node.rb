# Encoding: UTF-8
require_relative "choice"

class Node
  attr_accessor :id, :content, :is_final

  def initialize(node = {})
    @id = node['id']
    @content = node['content']
    @is_finale = node['is_final'] == 1
    @parent_id = node['parent_id']
    @choices = []
  end

  def add_choice(choice)
    @choices << Choice.new(choice)
  end
end

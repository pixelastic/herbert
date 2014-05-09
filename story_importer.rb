# Encoding: UTF-8
require "json"
require_relative "node_list"
require_relative "node"
require_relative "choice"

class StoryImporter
  def initialize(story_name)
    @story_name = story_name
    @story_dir = File.join(File.expand_path('.'), 'stories', @story_name)
    import_nodes
    import_choices
    p @node_list
  end

  def import_nodes
    nodes = JSON.parse(File.read(File.join(@story_dir, 'nodes.json')))
    @node_list = NodeList.new(nodes)
  end

  def import_choices
    choices = JSON.parse(File.read(File.join(@story_dir, 'choices.json')))
    choices.each do |choice|
      node = @node_list.get(choice['node_id'])
      node.add_choice(choice) if node
    end
  end
end

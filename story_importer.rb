# Encoding: UTF-8
require "json"
require_relative "node_list"
require_relative "node"

class StoryImporter
  def initialize(story_name)
    @story_name = story_name
    @story_dir = File.join(File.expand_path('.'), 'stories', @story_name)
    import_nodes
  end

  def import_nodes
    nodes = JSON.parse(File.read(File.join(@story_dir, 'nodes.json')))
    @node_list = NodeList.new(nodes)
  end
end

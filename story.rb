# Encoding: UTF-8
require "json"
require_relative "node_list"
require_relative "node"
require_relative "choice"

class Story
  attr_reader :nodes

  def initialize(story_name)
    @story_name = story_name
    @story_dir = File.join(File.expand_path('.'), 'stories', @story_name)
    @nodes = nil
    import_nodes
    import_choices
  end

  def import_nodes
    nodes = JSON.parse(File.read(File.join(@story_dir, 'nodes.json')))
    @nodes = NodeList.new(nodes)
  end

  def import_choices
    choices = JSON.parse(File.read(File.join(@story_dir, 'choices.json')))
    choices.each do |choice|
      node = @nodes.get(choice['node_id'])
      if !node
        p "WARNING: Unknown node for choice #{choice['id']}"
        next
      end
      node.add_choice(choice)
    end
  end

  def first_node
    return @nodes.first
  end

  def is_choice_valid(node, choice_index)
    return choice_index >= 0 && choice_index <= node.choices.length
  end
  
  def get_next_node_for_choice(node, choice_index)
    return @nodes.get(node.choices[choice_index].next_node_id)
  end

  def play
    current_node = first_node

    while !current_node.is_final
      current_node.display

      is_choice_valid = false
      while !is_choice_valid
        choice_index = gets.chomp.to_i - 1
        is_choice_valid = is_choice_valid(current_node, choice_index)
        if !is_choice_valid
          puts "Veuillez entrer un nombre correspondant à votre choix."
        end
      end
      current_node = get_next_node_for_choice(current_node, choice_index)
    end

    current_node.display
    puts
    puts "Fin de la réalité de #{@story_name}"
    gets
  end
end

# Encoding: UTF-8
require_relative "story"

class Main
  def initialize(story_name)
    @story = Story.new(story_name)
  end

  def run
    current_node = @story.first_node

    while !current_node.is_final
      current_node.display

      is_choice_valid = false
      while !is_choice_valid
        choice_index = gets.chomp.to_i - 1
        is_choice_valid = @story.is_choice_valid(current_node, choice_index)
        if !is_choice_valid
          puts "Veuillez entrer un nombre correspondant à votre choix."
        end
      end
      current_node = @story.get_next_node_for_choice(current_node, choice_index)
    end
    # while choice_index.nil? do
    #   puts choice_index
    #   choice
    # end
  end

end

Main.new('yasmine').run()

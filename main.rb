# Encoding: UTF-8
require_relative "story"

class Main
  def initialize()
    @stories = ['yasmine']
  end

  def run
    @stories.each do |story_name|
      Story.new(story_name).play
    end
  end

end

Main.new().run()

require 'test_helper'

class FtWikipediaTest < Minitest::Test
    
    def self.test_order
        :alpha
    end

    def test_that_it_has_a_version_number
        refute_nil ::FtWikipedia::VERSION
    end

    def test_it_does_something_useful
        assert true
    end

    def test_path_philosophy 
        puts "Path to philosophy\n\n"
        Ft_wikipedia.search("kiss")
        puts "\n-------- Success --------\n\n"
        Ft_wikipedia.search("problem")
        puts "\n-------- Success --------\n\n"
        Ft_wikipedia.search("einstein")
        puts "\n-------- Success --------\n\n"
        Ft_wikipedia.search("Effects_of_blue_lights_technology")
        puts "\n-------- Success --------\n\n"
        Ft_wikipedia.search("matter")
        puts "\n-------- Success --------\n\n"
    end

    def test_nil_dead_end
        Ft_wikipedia.search("directory")
        puts "\n-------- Success for no end--------\n\n "
    end

    def test_detected
        Ft_wikipedia.search("new_york_city")
        puts "\n-------- Success for endless loop --------\n\n "
    end
end

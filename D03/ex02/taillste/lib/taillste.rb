require "taillste/version"

module Taillste
	class Drum

		def initialize
		end

		def beat
			return [1, 4, 9]
		end
		
		def shuffle
			return [9, 1, 4]
		end

		def count
			return "1\n.\n.\n4\n.\n.\n.\n.\n9\n"
		end

		def played_with
			return "Both arms and legs"
		end
	end

	class Beat_box < Drum

		def beat
			return [1, 5, 7]
		end
		
		def shuffle
			return [7, 5, 1]
		end

		def count
			return "1\n.\n.\n.\n5\n.\n7\n"
		end

		def played_with
			return "Mouth"
		end
	end

	class Clap < Drum

		def beat
			return [2, 3, 7, 8]
		end
		
		def shuffle
			return [rand(100), rand(100), rand(100)]
		end

		def count
			return "2\n3\n.\n.\n.\n7\n8\n"
		end

		def played_with
			return "Both_hands"
		end
	end
end
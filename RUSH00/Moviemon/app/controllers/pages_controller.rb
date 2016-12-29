class PagesController < ApplicationController
	before_action :check_fight_or_not, only: [:left, :right, :up, :down], unless: -> { $view['moviedex'] == true }
	$game = Game.new
	$selected = Selected.new
	$player = Player.new
	$view = {}

	def index	
		return
	end

	def reboot
		$game = Game.new
		$selected = Selected.new
		$player = Player.new
		$view = {}
		render :accueil
	end


	def fight_or_not
		$game.current_movie = $game.get_movie
		if $game.current_movie == nil
			render :the_end
			return
		end
		render :fight_or_not
	end

	def result
		$player.life != 0
	end

	def check_fight_or_not
		# byebug
	
		if $selected.in_use == false
			if rand(0..6) == 2
				fight_or_not 
			end
		end
	end

	def lost
		$game.lost = true
		render :lost
	end

	def up
		if $selected.in_use == true
			$selected.active -= 1 unless $selected.active == 0
			render :select
			return
		end
		$player.y_pos -= 1 unless $player.y_pos == 0
		redirect_to action: :index
	end

	def down
		if $selected.in_use == true
			$selected.active += 1 unless $selected.active == 2
			render :select
			return
		end
		$player.y_pos += 1 unless $player.y_pos == 9
		redirect_to action: :index
	end

	def left
		if $view['moviedex'] == true
			$player.index_movie -= 1 unless $player.index_movie <=  0
			render :moviedex
			return
		end
		$player.x_pos -= 1 unless $player.x_pos == 0
		redirect_to action: :index
	end

	def right
		if $view['moviedex'] == true
			$player.index_movie += 1 unless $player.index_movie >=  $player.moviedex.length - 1
			render :moviedex
			return
		end
		$player.x_pos += 1 unless $player.x_pos == 9
		redirect_to action: :index 
	end

	def a_button
		if $game.victory == true
			$game.victory = false
			$player.life = 500
			redirect_to action: :index
			return
		end

		if $game.lost == true
			$game.lost = false
			$player.life = 500
			redirect_to action: :index
			return
		end
		if $game.fight == true
			strength_movie = $game.current_movie.infos[:rating]
			life_movie = $game.current_movie.infos[:life]
			$player.life -= strength_movie
			life_movie = life_movie - $player.avg_strength - $player.strength

			$game.current_movie.infos[:life] = life_movie
		end
		$game.fight = true
		if $player.life <= 0 or $game.current_movie.infos[:life] <= 0
			if $player.life < $game.current_movie.infos[:life]
				$game.fight = false
				lost
				return
			else
				$game.fight = false
				$game.victory = true
				$player.moviedex << $game.current_movie
				$player.life = 500
				$player.strength = $player.moviedex.length * 10
				render :victory
				return
			end
		end
		render :fight
	end

	def b_button
		if $view['moviedex']
			$player.moviedex_in_use = false
			$view['moviedex'] = false
			# byebug
			redirect_to action: :index
			return
		end
		$game.fight = false
		$game.lost = true
		$player.life = 500

		render :lost
	end

	def save
		$game.save
		$selected.in_use = false
		redirect_to action: :index
	end

	def select
		$selected.in_use = true
		render :select
	end

	def start
		if $game.index_page == true
			moviedex
		end
		$game.index_page = true
		$selected.action = "save"
		redirect_to action: :index	
	end

	def moviedex
		$view['moviedex'] = true
		# $view['moviedex'] = true if $player.moviedex.size == 0
			# byebug
			# render :moviedex
		# return
		render :moviedex
	end

	def load
		$game.load
		$selected.in_use = false
		$selected.action = "save"
		redirect_to action: :index
	end

end

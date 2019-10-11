require "pry"

def game_hash
  {
    :home => { 
      :team_name => "Brooklyn Nets",
                  :colors => ["Black", "White"],
                  :players => [
                    {:player_name => "Alan Anderson",
                     :number => 0,
                     :shoe => 16,
                     :points => 22,
                     :rebounds => 12,
                     :assists => 12,
                     :steals => 3,
                     :blocks => 1,
                     :slam_dunks => 1
                    },
                    {:player_name => "Reggie Evans",
                     :number => 30,
                     :shoe => 14,
                     :points => 12,
                     :rebounds => 12,
                     :assists => 12,
                     :steals => 12,
                     :blocks => 12,
                     :slam_dunks => 7
                    },
                    {:player_name => "Brook Lopez",
                     :number => 11,
                     :shoe => 17,
                     :points => 17,
                     :rebounds => 19,
                     :assists => 10,
                     :steals => 3,
                     :blocks => 1,
                     :slam_dunks => 15
                    },
                    {:player_name => "Mason Plumlee",
                     :number => 1,
                     :shoe => 19,
                     :points => 26,
                     :rebounds => 11,
                     :assists => 6,
                     :steals => 3,
                     :blocks => 8,
                     :slam_dunks => 5
                    },
                    {:player_name => "Jason Terry",
                     :number => 31,
                     :shoe => 15,
                     :points => 19,
                     :rebounds => 2,
                     :assists => 2,
                     :steals => 4,
                     :blocks => 11,
                     :slam_dunks => 1
                    }
                  ]
    },
    :away => { 
      :team_name => "Charlotte Hornets",
              :colors => ["Turquoise", "Purple"],
              :players => [
                {:player_name => "Jeff Adrien",
                 :number => 4,
                 :shoe => 18,
                 :points => 10,
                 :rebounds => 1,
                 :assists => 1,
                 :steals => 2,
                 :blocks => 7,
                 :slam_dunks => 2
                },
                {:player_name => "Bismack Biyombo",
                 :number => 0,
                 :shoe => 16,
                 :points => 12,
                 :rebounds => 4,
                 :assists => 7,
                 :steals => 22,
                 :blocks => 15,
                 :slam_dunks => 10
                },
                {:player_name => "DeSagna Diop",
                 :number => 2,
                 :shoe => 14,
                 :points => 24,
                 :rebounds => 12,
                 :assists => 12,
                 :steals => 4,
                 :blocks => 5,
                 :slam_dunks => 5
                },
                {:player_name => "Ben Gordon",
                 :number => 8,
                 :shoe => 15,
                 :points => 33,
                 :rebounds => 3,
                 :assists => 2,
                 :steals => 1,
                 :blocks => 1,
                 :slam_dunks => 0
                },
                {:player_name => "Kemba Walker",
                 :number => 33,
                 :shoe => 15,
                 :points => 6,
                 :rebounds => 12,
                 :assists => 12,
                 :steals => 7,
                 :blocks => 5,
                 :slam_dunks => 12
                }
              ]
    }
  }  
  end




def num_points_scored(name)
  game_hash.each do |location, team|
    team.each do |team_info, data|
      # puts data
      if team_info == :players
        # puts data
        data.each do |player|
          # puts player
          # puts player[:player_name]
          # puts player[:points]
          if player[:player_name] == name
            return player[:points]
          end

        end
      end
    end
  end
end


def shoe_size(name) 
  game_hash.each do |location, team|
    team.each do |team_info, data|
      # puts data
      # puts team_info
      if team_info == :players
        data.each do |player|
          # puts player
          if player[:player_name] == name
            return player[:shoe]
          end
        end
      end
    end
  end
end



def team_colors(team_name)
  game_hash.each do |location, team_data|
    # puts game_hash[location][:team_name]
    # puts game_hash[location].key? (:team_name)
    # puts game_hash[location][:team_name] == team_name
    
    if game_hash[location].key?(:team_name) && game_hash[location][:team_name] == team_name
      return game_hash[location][:colors]
    end
    
  end
end


# def team_names
#   team_array = []
#   game_hash.each do |location, team_data|
#     # p team_data[:team_name]
#     team_array.push(team_data[:team_name])
#   end
#   team_array
# end

def team_names
  # team_array = []
  game_hash.map do |location, team_data|
    # p team_data[:team_name]
    team_data[:team_name]
  end
end


def player_numbers(team_name)
  player_numbers_array = []
  game_hash.each do |location, team_data|
      # puts team_data[:team_name]
      if team_data[:team_name] == team_name
        team_data[:players].each do |player_hash|
          # puts player_hash[:number]
          player_numbers_array.push(player_hash[:number])
        end
      end
  end
  player_numbers_array
end


def player_stats(player_name)
  hash = {}
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      # puts attribute
      if attribute == :players
        data.each do |player_hash|
          # puts player_hash[:player_name]
          if player_hash[:player_name] == player_name
            # puts player_hash
            player_hash.each do |player_attribute, player_data|
              # puts player_attribute
              # puts player_data
              hash[player_attribute] = player_data
            end
          end
        end
      end
    end
  end
  hash.delete(:player_name)
  hash
end


def big_shoe_rebounds
  largest_shoe = 0
  most_rebounds = nil
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      # p attribute
      # p data
      if attribute == :players
        # puts team_data[:players]
        team_data[:players].each do |player_hash|
          # puts player_hash[:shoe]
          if player_hash[:shoe] > largest_shoe
            largest_shoe = player_hash[:shoe]
            # puts largest_shoe
            most_rebounds = player_hash[:rebounds]
          end
        end
      end
    end
  end
  most_rebounds
end


def most_points_scored
  most_points_player = nil
  most_points = 0
  game_hash.each do |location, team_data|
    # puts team_data[:players]
    team_data[:players].each do |player_hash|
      # puts player_hash
      if player_hash[:points] > most_points
        most_points = player_hash[:points]
        most_points_player = player_hash[:player_name]
      end
    end
  end
  most_points_player
end





def winning_team
  home_total_points = []
  away_total_points = []
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_hash|
      if location == :home
        home_total_points.push(player_hash[:points])
      elsif location == :away
        away_total_points.push(player_hash[:points])
      end
    end

  end
  # p home_total_points
  # p away_total_points
  home_points_sum = home_total_points.reduce(0) { |sum, num| sum + num }
  away_points_sum = away_total_points.reduce(0) { |sum, num| sum + num }

  if home_points_sum > away_points_sum
    game_hash[:home][:team_name]
  else
    game_hash[:away][:team_name]
  end

end



def player_with_longest_name
  longest_name = ""

  game_hash.each do |location, team_data|
    team_data[:players].each do |player_hash|
      # puts player_hash
      if player_hash[:player_name].length - 1 > longest_name.length
        longest_name = player_hash[:player_name]
      end
    end
  end
  longest_name
end


def long_name_steals_a_ton?
  longest_name = player_with_longest_name
  most_steals = 0
  player = nil

  game_hash.each do |location, team_data|
    team_data[:players].each do |player_hash|
      if player_hash[:steals] > most_steals
        most_steals = player_hash[:steals]
        player = player_hash[:player_name]
      end
    end
  end
  # player
  longest_name == player ? true : false
end
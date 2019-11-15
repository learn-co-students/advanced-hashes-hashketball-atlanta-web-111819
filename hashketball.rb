require 'pry'
def game_hash
{
  :home => { :team_name => "Brooklyn Nets",
             :colors => ["Black", "White"],
             :players => [
                {
                  :player_name => "Alan Anderson",
                  :number => 0,
                  :shoe => 16,
                  :points => 22,
                  :rebounds => 12,
                  :assists => 12,
                  :steals => 3,
                  :blocks => 1,
                  :slam_dunks => 1
                },
                {
                  :player_name => "Reggie Evans",
                  :number => 30,
                  :shoe => 14,
                  :points => 12,
                  :rebounds => 12,
                  :assists => 12,
                  :steals => 12,
                  :blocks => 12,
                  :slam_dunks => 7
                },
                {
                  :player_name => "Brook Lopez",
                  :number => 11,
                  :shoe => 17,
                  :points => 17,
                  :rebounds => 19,
                  :assists => 10,
                  :steals => 3,
                  :blocks => 1,
                  :slam_dunks => 15
                },
                {
                  :player_name => "Mason Plumlee",
                  :number => 1,
                  :shoe => 19,
                  :points => 26,
                  :rebounds => 11,
                  :assists => 6,
                  :steals => 3,
                  :blocks => 8,
                  :slam_dunks => 5
                },
                {
                  :player_name => "Jason Terry",
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
                  {
                    :player_name => "Jeff Adrien",
                    :number => 4,
                    :shoe => 18,
                    :points => 10,
                    :rebounds => 1,
                    :assists => 1,
                    :steals => 2,
                    :blocks => 7,
                    :slam_dunks => 2
                  },
                  {
                    :player_name => "Bismack Biyombo",
                    :number => 0,
                    :shoe => 16,
                    :points => 12,
                    :rebounds => 4,
                    :assists => 7,
                    :steals => 22,
                    :blocks => 15,
                    :slam_dunks => 10
                  },
                  {
                    :player_name => "DeSagna Diop",
                    :number => 2,
                    :shoe => 14,
                    :points => 24,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 4,
                    :blocks => 5,
                    :slam_dunks => 5
                  },
                  {
                    :player_name => "Ben Gordon",
                    :number => 8,
                    :shoe => 15,
                    :points => 33,
                    :rebounds => 3,
                    :assists => 2,
                    :steals => 1,
                    :blocks => 1,
                    :slam_dunks => 0
                  },
                  {
                    :player_name => "Kemba Walker",
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

def num_points_scored(player)
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |baller|
          if baller[:player_name] == player
            #pp baller[:points]
             return baller[:points]
          end
        end
      end
    end
  end
end

def shoe_size(player)
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |baller|
          if baller[:player_name] == player
            #pp baller[:points]
             return baller[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team)
  hues = 0
  game_hash.each do |place, name|
    name.each do |group, mascot|
      if mascot == team
        hues = name[:colors]
        #binding.pry
      end

  end
  end
  hues
end

def team_names
  team_array = []
  game_hash.each do |place, name|
  team_array.push(name[:team_name])
  end
  team_array
end

def player_numbers(team_name)
  jersey_array = []
  game_hash.each do |location, team|
  team.each do |value1, name|
  if name == team_name
     team[:players].each do |player|

       jersey_array.push(player[:number])

     end
  end

    end
end
jersey_array
end

def player_stats(player)
  baller_stats = {}
  game_hash.each do |location, team|
    team.each do |value1, name|
      if value1 == :players
        name.each do |baller|
        if baller[:player_name] == player
          pp baller
            baller_stats = baller.delete_if do |k, v|
              k == :player_name
            end
        end
        end

      end
    end

  end
baller_stats
end

def big_shoe_rebounds
  biggest_shoe = 0
  big_foot = {}
  game_hash.each do |location, team|
    team.each do |value1, name|
      if value1 == :players
        name.each do |baller|

          if baller[:shoe] > biggest_shoe
            biggest_shoe = baller[:shoe]
            big_foot = baller
          end

        end
      end
    end
  end
  big_foot[:rebounds]
end

def most_points_scored
  most_points = 0
  high_scorer = {}
  game_hash.each do |location, team|
    team.each do |value1, name|
      if value1 == :players
        name.each do |baller|
          if baller[:points] > most_points
            most_points = baller[:points]
            high_scorer = baller
          end
        end
      end
    end
  end
  high_scorer[:player_name]
end

def winning_team
  nets_final= 0
  hornets_final = 0

  game_hash.each do |location, team|
       team.each do |value1, name|
         if value1 == :players
           name.each do |baller|
             if team[:team_name] == "Brooklyn Nets"
               nets_final += baller[:points]
             else
               hornets_final += baller[:points]
             end
           end

         end

       end

  end
  if nets_final > hornets_final
     "Brooklyn Nets"
  else
     "Charlotte Hornets"
   end
end

def player_with_longest_name
  most_letters = 0
  long_name = {}
  game_hash.each do |location, team|
    team.each do |value1, name|
      if value1 == :players
        name.each do |player, attributes|
        if player[:player_name].split('').length > most_letters
            most_letters = player[:player_name].split('').length
            long_name = player[:player_name]
          end
      end

      end
    end
end
long_name

end

def long_name_steals_a_ton?
  longest_name = player_with_longest_name
  most_steals = 0
  steeler = 0
  long_name = {}
  game_hash.each do |location, team|
    team.each do |value1, name|
      if value1 == :players
        name.each do |player, attributes|
        if player[:steals] > most_steals
            most_steals = player[:steals]
            steeler = player[:player_name]
          end
      end

      end
    end
end
if longest_name == steeler
  true
end
end

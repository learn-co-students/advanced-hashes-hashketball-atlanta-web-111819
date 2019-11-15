def game_hash 
  game_hash =
{
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => {
      "Alan Anderson" => {
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
      },
      "Reggie Evans" => {
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
      },
      "Brook Lopez" => {
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
      },
      "Mason Plumlee" => {
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
      },
      "Jason Terry" => {
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
      }
    }
  },
  :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => {
      "Jeff Adrien" => {
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
      },
      "Bismack Biyombo" => {
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10
      },
      "DeSagna Diop" => {
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
      },
      "Ben Gordon" => {
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
      },
      "Kemba Walker" => {
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 7,
        :blocks => 5,
        :slam_dunks =>12
      }
    }
  }

  
}

end 
  
  
  




def num_points_scored(name)
arr = []
game_hash.each do |loc, data|
    data.each do |att, val|
        if att == :players
          val.each do |per, dat|
            dat.each do |x, y|
              if per == name && x == :points
                arr.push(y)
              end

            end
          end
        end
    end
end
return arr[0]
end

def shoe_size(name)
  arr = []
  game_hash.each do |loc, data|
    data.each do |att, val|
      if att == :players
        val.each do |per, dat|
          dat.each do |x,y|
            if per == name && x == :shoe 
              arr.push(y)
            end 
          end 
        end
      end 
    end 
  end 
  return arr[0]
end 




def team_colors(team)
  if team == "Charlotte Hornets"
    game_hash[:away][:colors]
  elsif team == "Brooklyn Nets"
    game_hash[:home][:colors]
  else

  end
end

def team_names
arr = []
  game_hash.each do |loc, data|
      data.each do |att, val|
          if att == :team_name
                arr.push(val)

            end
          end
  end
  return arr
end


def player_stats(name)
  arr=[]
  game_hash.each do |loc, data|
      data.each do |att, val|
          if att == :players
            val.each do |per, dat|
                if per == name
                  arr.push(dat)
                end
            end
          end
      end
  end
  return arr[0]
end


def player_numbers(team)
  array2 = []
  if(team == "Brooklyn Nets") 
    t = "home"
    sym = t.to_sym
  end
  if(team == "Charlotte Hornets") 
    t = "away"
    sym = t.to_sym
  end 
  game_hash[sym][:players].each_value do |x|
    array2.push(x[:number])
  end 
  return array2
end 

def big_shoe_rebounds 
  shoe_size = 0 
  rebound = 0 
  game_hash[:home][:players].each do |x,y|
    if(y[:shoe] > shoe_size) 
      shoe_size = y[:shoe]
      rebound = y[:rebounds]
    end 
  end 
  game_hash[:away][:players].each do |x,y|
    if(y[:shoe] > shoe_size) 
      shoe_size = y[:shoe]
      rebound = y[:rebounds]
    end 
  end
  
  return rebound
  
end 


def most_points_scored
  points = 0 
  name = ""
  game_hash[:home][:players].each do |x,y|
    if(y[:points] > points)
      points = y[:points]
      name = x 
    end 
  end 
  game_hash[:away][:players].each do |x,y|
    if(y[:points] > points)
      points = y[:points]
      name = x 
    end
  end 
  p name
  
  
end 

def winning_team
  total1 = 0 
  total2 = 0 
  winner = ""
  game_hash[:home][:players].each do |x,y|
    total1 += y[:points]
  end 
  game_hash[:away][:players].each do |x,y|
    total2 += y[:points]
  end 
  if total1 > total2
    winner = "Brooklyn Nets"
  else 
    winner = "Charlotte Hornets"
  end 
  return winner
  
  
  
end 



def player_with_longest_name
  name = ""
  game_hash[:home][:players].each do |x,y|
    if x.length > name.length
      name = x
    end 
  end 
  game_hash[:away][:players].each do |x,y|
    if x.length > name.length
      name = x 
    end 
  end 
  return name
  
  
  
  
  
  
end 




def long_name_steals_a_ton? 
  
  name = ""
  players_steal = 0 
  higest_steals = 0
  game_hash[:home][:players].each do |x,y|
    if x.length > name.length
      name = x
      players_steal = y[:steals]
    
    end
  
    if y[:steals] > higest_steals
      higest_steals = y[:steals]
      
    end 
  end 
  game_hash[:away][:players].each do |x,y|
    if x.length > name.length
      name = x 
      players_steal = y[:steals]
    end 
    if y[:steals] > higest_steals
      higest_steals = y[:steals]
    end 
  end 
  p players_steal
  p higest_steals
  if players_steal == higest_steals
    return true
  else 
    return false
  end 
  
  
  
  
  
end








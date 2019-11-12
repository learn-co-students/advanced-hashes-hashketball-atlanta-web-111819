require "pry"

def game_hash
  basket = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
        number: 0,
        shoe: 16,
        points: 22,
        rebounds: 12,
        assists: 12,
        steals: 3,
        blocks: 1,
        slam_dunks: 1},
        "Reggie Evans" => {
        number: 30,
        shoe: 14,
        points: 12,
        rebounds: 12,
        assists: 12,
        steals: 12,
        blocks: 12,
        slam_dunks: 7},
        "Brook Lopez" => {
        number: 11,
        shoe: 17,
        points: 17,
        rebounds: 19,
        assists: 10,
        steals: 3,
        blocks: 1,
        slam_dunks: 15},
        "Mason Plumlee" => {
        number: 1,
        shoe: 19,
        points: 26,
        rebounds: 11,
        assists: 6,
        steals: 3,
        blocks: 8,
        slam_dunks: 5},
        "Jason Terry" => {
        number: 31,
        shoe: 15,
        points: 19,
        rebounds: 2,
        assists: 2,
        steals: 4,
        blocks: 11,
        slam_dunks: 1}
      }
    },
    :away => {
      :team_name => "Charolotte Hornets",
      :colors => ["Turqoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
        number: 4,
        shoe: 18,
        points: 10,
        rebounds: 1,
        assists: 1,
        steals: 2,
        blocks: 7,
        slam_dunks: 2},
        "Bismack Biyombo" => {
        number: 0,
        shoe: 16,
        points: 12,
        rebounds: 4,
        assists: 7,
        steals: 22,
        blocks: 15,
        slam_dunks: 10},
        "DeSagana Diop" => {
        number: 2,
        shoe: 14,
        points: 24,
        rebounds: 12,
        assists: 12,
        steals: 4,
        blocks: 5,
        slam_dunks: 5},
        "Ben Gordon" => {
        number: 8,
        shoe: 15,
        points: 33,
        rebounds: 3,
        assists: 2,
        steals: 1,
        blocks: 1,
        slam_dunks: 0},
        "Kemba Walker" => {
        number: 33,
        shoe: 15,
        points: 6,
        rebounds: 12,
        assists: 12,
        steals: 7,
        blocks: 5,
        slam_dunks: 12}
      }
        
    }
  }
  
  return basket
end

def num_points_scored(name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |attribute, data|
    if attribute == name
      data.each do |stat, value|
        if stat == :points
          return value
        end
      end
    end
  end
end
end

def shoe_size(name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |attribute, data|
      if attribute == name
        data.each do |stat, value|
          if stat == :shoe
            return value
          end
        end
      end
    end
  end
end

def team_colors(tName)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == tName
      return team_data[:colors]
    end
  end
end

def team_names
  game_hash.each do |location, team_data|
    return team_data[:team_name]
  end
end

def player_numbers(tName)
  array = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == tName
      team_data[:players].each do |player_name, value|
        array << value[:number]
      end
    end
  end
  return array
end

def player_stats(name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, value|
      if player_name == name
        return value
      end
    end
  end
end

def big_shoe_rebounds
  size = 0 
  rebound = 0 
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, value|
      if value[:shoe] > size
        size = value[:shoe]
        rebound = value[:rebounds]
      end
    end
  end
  return rebound
end












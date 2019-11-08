require "pry"

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: "Black, White",
      players: [
        {player_name: "Alan Anderson", number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
        {player_name: "Reggie Evans", number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
        {player_name: "Brook Lopez", number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
        {player_name: "Mason Plumlee", number: 1, shoe: 19, points: 26, rebounds: 11, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
        {player_name: "Jason Terry", number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1},
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: "Turquoise, Purple",
      players: [
        {player_name: "Jeff Adrien", number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
        {player_name: "Bismack Biyombo", number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 22, blocks: 15, slam_dunks: 10},
        {player_name: "DeSagna Diop", number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
        {player_name: "Ben Gordon", number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
        {player_name: "Kemba Walker", number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 7, blocks: 5, slam_dunks: 12},
      ]
    }
  }
end

def get_team(team_name)
  g = game_hash
  team = (g.find {|home, team| team[:team_name] == team_name})
  team[1]
end

def is_player_on_team?(player, team)
  #team = get_team(team)
  players = team[:players]
  result = players.find {|p| p[:player_name] == player}
  result ? true : false
end

def get_player_on_team(player, team)
  players = team[:players]
  players.find {|p| p[:player_name] == player}
end

def get_player_data(player, attribute)
  g = game_hash
  home_team = is_player_on_team?(player, g[:home])
  #binding.pry
  team = (home_team ? g[:home] : g[:away])
  #binding.pry
  player_data = get_player_on_team(player, team)
  #binding.pry
  player_data[attribute]
end

def num_points_scored(player)
  get_player_data(player, :points)
end

def shoe_size(player_name)
  get_player_data(player_name, :shoe)
end

def get_team_data(team_name, attribute)
  team = get_team(team_name)
  #binding.pry
  team[attribute]
end

def team_colors(team_name)
  get_team_data(team_name, :colors).split(", ")
end

def team_names
  g = game_hash
  [g[:home][:team_name], g[:away][:team_name]]
end

def player_numbers(team_name)
  players = get_team_data(team_name, :players)
  numbers = players.map {|p| p[:number]}
  numbers
end

def player_stats(player_name)
  g = game_hash
  home_team = is_player_on_team?(player_name, g[:home])
  #binding.pry
  team = (home_team ? g[:home] : g[:away])
  #binding.pry
  player_data = get_player_on_team(player_name, team).filter do |k, v|
    k != :player_name
  end

  player_data
end

def all_players
  g = game_hash
  g[:home][:players] + g[:away][:players]
end

def get_attribute_of_player_with_most_of_attribute(target_attribute)
  remaining_players = all_players
  largest = yield(remaining_players[0])

  while remaining_players.length > 2
    largest = yield(remaining_players[0])
    remaining_players = remaining_players.select do |p|
      yield(p) > largest
    end
  end
  remaining_players[0][target_attribute]
end

def big_shoe_rebounds
  get_attribute_of_player_with_most_of_attribute(:rebounds) {|player| player[:shoe]}
end

def most_points_scored
  get_attribute_of_player_with_most_of_attribute(:player_name) {|player| player[:points]}
end

def winning_team
  g = game_hash
  home_players = g[:home][:players]
  home_points = home_players.reduce(0) {|memo, p| memo += p[:points]}

  away_players = g[:away][:players]
  away_points = away_players.reduce(0) {|memo, p| memo += p[:points]}

  home_points > away_points ? g[:home][:team_name] : g[:away][:team_name]
end

def player_with_longest_name
  get_attribute_of_player_with_most_of_attribute(:player_name) {|p| p[:player_name].length}
end

def long_name_steals_a_ton?
  longest_player = get_attribute_of_player_with_most_of_attribute(:player_name) {|p| p[:player_name].length}
  most_steals = get_attribute_of_player_with_most_of_attribute(:player_name) {|p| p[:steals]}
  longest_player == most_steals
end

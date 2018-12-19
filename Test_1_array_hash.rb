require 'rspec/autorun'

class TwitchUtility
  attr_accessor :viewing_stats

  def initialize(viewing_stats = DefaultStats.defaults)

  end

  def change_title(old_title, new_title)

  end

  def get_games(key, value)

  end

  def sorted_titles

  end

  def total_hours_streamed_by_genre(genre)

  end

  def most_streamed_publishers_peak_viewer_total

  end
end

RSpec.describe TwitchUtility do
  subject { TwitchUtility.new }

  it 'has defaults' do
    expect(subject.viewing_stats).to eq DefaultStats.defaults
  end

  context "acts on data mutably," do
    it 'changes a games title' do
      subject.change_title("Playerunkonwn's Battlegrounds", "Playerunknown's Battlegrounds")
      expect(subject.viewing_stats).to include(
        {
          :title=>"Playerunknown's Battlegrounds",
          :peak_viewers=>231,
          :total_hours_streamed=>2007,
          :genre=>"Battle Royal",
          :publisher=>"PUBG Corporation"
        })
    end
  end

  it 'can find any game based on criteria' do
    expect(subject.get_games(:title, "Grand Theft Auto V")).to eq []
    expect(subject.get_games(:title, "Dota 2")).to eq [
                                                        {
                                                          :title=>"Dota 2",
                                                          :peak_viewers=>200,
                                                          :total_hours_streamed=>2258,
                                                          :genre=>"MOBA",
                                                          :publisher=>"Valve"
                                                        }
                                                      ]
    expect(subject.get_games(:genre, "MOBA")).to eq [
                                                      {
                                                        title: "League of Legends",
                                                        peak_viewers: 190,
                                                        total_hours_streamed: 670,
                                                        genre: "MOBA",
                                                        publisher: "Riot"
                                                      },
                                                      {
                                                        :title=>"Dota 2",
                                                        :peak_viewers=>200,
                                                        :total_hours_streamed=>2258,
                                                        :genre=>"MOBA",
                                                        :publisher=>"Valve"
                                                      },
                                                    ]
    expect(subject.viewing_stats).to eq DefaultStats.defaults
  end

  it 'sorts data by Title' do
    expect(subject.sorted_titles.size).to eq 23
    expect(subject.sorted_titles.first[:title]).to eq "Call of Duty: Black Ops 4"
    expect(subject.sorted_titles.last[:title]).to eq "World of Warcraft"
  end

  it 'totals the hours streamed for a particular genre' do
    expect(subject.total_hours_streamed_by_genre("Pokemon")).to eq 0
    expect(subject.total_hours_streamed_by_genre("MMORPG")).to eq 64
    expect(subject.total_hours_streamed_by_genre("Fighter")).to eq 628
  end

  it 'finds the most popular publishers games' do
    expect(subject.most_streamed_publishers_peak_viewer_total).to eq 436
  end
end

class DefaultStats
  DEFAULTS =
    [
      {title: "Fortnite", peak_viewers: 129, total_hours_streamed: 522, genre: "Battle Royal", publisher: "Epic"},
      {title: "World of Warcraft", peak_viewers: 44, total_hours_streamed: 64, genre: "MMORPG", publisher: "Blizzard"},
      {title: "League of Legends", peak_viewers: 190, total_hours_streamed: 670, genre: "MOBA", publisher: "Riot"},
      {title: "Hearthstone", peak_viewers: 146, total_hours_streamed: 1328, genre: "DCCG", publisher: "Blizzard"},
      {title: "Overwatch", peak_viewers: 165, total_hours_streamed: 1931, genre: "FPS", publisher: "Blizzard"},
      {title: "Playerunkonwn's Battlegrounds", peak_viewers: 231, total_hours_streamed: 2007, genre: "Battle Royal", publisher: "PUBG Corporation"},
      {title: "Monster Hunter World", peak_viewers: 194, total_hours_streamed: 170, genre: "ARPG", publisher: "Capcom"},
      {title: "Super Smash Bros Melee", peak_viewers: 20, total_hours_streamed: 281, genre: "Fighter", publisher: "Nintendo"},
      {title: "Starcraft 2", peak_viewers: 55, total_hours_streamed: 1840, genre: "RTS", publisher: "Blizzard"},
      {title: "Super Smash Bros Wii U", peak_viewers: 155, total_hours_streamed: 231, genre: "Fighter", publisher: "Nintendo"},
      {title: "Madden", peak_viewers: 51 , total_hours_streamed: 141, genre: "Sports", publisher: "EA Sports"},
      {title: "Minecraft", peak_viewers: 29, total_hours_streamed: 165, genre: "Sandbox", publisher: "Mojang"},
      {title: "Rocket League", peak_viewers: 29, total_hours_streamed: 135, genre: "Sports", publisher: "Psyonix"},
      {title: "Street Fighter V", peak_viewers: 192, total_hours_streamed: 101, genre: "Fighter", publisher: "Capcom"},
      {title: "Dragon Ball Fighter Z", peak_viewers: 43, total_hours_streamed: 15, genre: "Fighter", publisher: "Bandai Namco"},
      {title: "Dota 2", peak_viewers: 200, total_hours_streamed: 2258, genre: "MOBA", publisher: "Valve"},
      {title: "Diablo 3", peak_viewers: 26, total_hours_streamed: 2506, genre: "ARPG", publisher: "Blizzard"},
      {title: "Skyrim", peak_viewers: 44, total_hours_streamed: 659, genre: "ARPG", publisher: "Bethesda"},
      {title: "Destiny 2", peak_viewers: 136, total_hours_streamed: 2653, genre: "FPS", publisher: "Activision"},
      {title: "Call of Duty: Black Ops 4", peak_viewers: 103, total_hours_streamed: 774, genre: "FPS", publisher: "Activision"},
      {title: "Tom Clancy's Rainbow Six Siege", peak_viewers: 151, total_hours_streamed: 1956, genre: "FPS", publisher: "Ubisoft"},
      {title: "Counter-Strike: Global Offensive", peak_viewers: 199, total_hours_streamed: 2435, genre: "FPS", publisher: "Valve"},
      {title: "Fifa 18", peak_viewers: 47, total_hours_streamed: 831, genre: "Sports", publisher: "EA sports"}
    ]

  def self.defaults
    DEFAULTS
  end
end
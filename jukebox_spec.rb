require 'simplecov'
SimpleCov.start
require 'json'
require 'rspec'

require_relative 'jukebox'
require_relative 'song'

#use this song data for your tests
#songs = [
 #"The Phoenix - 1901",
 #"Tokyo Police Club - Wait Up",
 #"Sufjan Stevens - Too Much",
 #"The Naked and the Famous - Young Blood",
 #"(Far From) Home - Tiga",
 #"The Cults - Abducted",
 #"The Phoenix - Consolation Prizes"
#]

describe Song do
  before(:each) do
    @song = Song.new("great success")
  end

  it "can be initialized" do
    @song.should be_an_instance_of(Song)
  end

  it "can have a name" do
    @song.name.should eq("great success")
  end
end

describe Jukebox do
  before(:each) do
    @songs = (1..3).collect { |i| Song.new("#{i}. another song") }
    @jukebox = Jukebox.new(@songs)
  end

  it "can be initialized" do
    @jukebox.should be_an_instance_of(Jukebox)
  end

  it "returns string NOW PLAYING when play command is given" do
    @jukebox.play("something").should include("now playing")
  end

  it "outputs a list of songs" do
    @jukebox.list.should include("another song")
  end
end

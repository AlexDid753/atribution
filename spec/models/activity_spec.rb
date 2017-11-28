require 'spec_helper'

describe Activity do
  before(:all) do
    @activity = Activity.new(title: 'Trip to Europa', arpu: 15.44)
  end

  it "should has a title" do
    @activity.title.should eq 'Trip to Europa'
  end

  it "should has an arpu" do
    @activity.arpu.should eq 15.44
  end

  it "should round an arpu" do
    @activity.arpu_round.should eq 15
  end
end

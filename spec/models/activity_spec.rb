require 'spec_helper'

describe Activity do
  before(:all) do
    @activity = Activity.new(title: 'Trip to Europa', apru: 15.44)
  end

  it "should has a title" do
    @activity.title.should eq 'Trip to Europa'
  end

  it "should has an apru" do
    @activity.apru.should eq 15.44
  end

  it "should round an apru" do
    @activity.apru_round.should eq 15
  end
end

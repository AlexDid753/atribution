require 'spec_helper'

describe Visitor do
  before(:all) do
    @visitor = Visitor.create!()
    @medium = Medium.new()
    @activity = Activity.new()
  end

  it "should has a history" do
    @visitor.histories.should_not be_false
  end

  it "should has a medium" do
    @visitor.mediums.should_not be_false
  end

  it "should has an activities" do
    @visitor.activities.should_not be_false
  end

  it "should create visit history note" do
    @visitor.visit_activity(@medium,@activity)
    expect(@visitor.histories.where(medium_id: @medium)).to have(1).record
  end
end

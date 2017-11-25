require 'spec_helper'

describe Medium do
  before(:all) do
    @medium = Medium.new(title: 'cpc')
  end

  it {should respond_to (:title)}
end

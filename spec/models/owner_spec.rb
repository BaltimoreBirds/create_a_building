require 'spec_helper'

describe Owner do
  it{should have_valid(:first_name).when("name")}
  it{should_not have_valid(:first_name).when(nil, " ")}

  it{should have_valid(:last_name).when("name")}
  it{should_not have_valid(:last_name).when(nil, " ")}

  it{should have_valid(:email).when("email")}
  it{should_not have_valid(:email).when(nil, " ")}

  it{should have_many :buildings }
end

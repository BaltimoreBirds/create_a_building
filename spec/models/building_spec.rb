require 'spec_helper'

describe Building do
  it{should have_valid(:street_address).when("buckstone court", "alfalfa court")}
  it{should_not have_valid(:street_address).when(nil, " ")}

  it{should have_valid(:city).when("Baltimore", " Boston")}
  it{should_not have_valid(:city).when(nil, " ")}

  it{should have_valid(:postal_code).when( 21044 )}
  it{should_not have_valid(:postal_code).when(nil, "String", " ")}

  it{should have_valid(:state).when("Maryland", "California")}
  it{should_not have_valid(:state).when(nil, " ", "Baltimore")}


end

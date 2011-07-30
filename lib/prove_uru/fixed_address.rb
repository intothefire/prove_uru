class ProveUru::FixedAddress
  attr_accessor :postcode, :building_name :building_no, :sub_building, :organisation, :street, :sub_street, :town, :district
  
  def to_prove_hash
    {
      "Postcode" => :postcode, 
      "BuildingName" => :building_name, 
      "BuildingNo" => :building_no, 
      "SubBuilding" =>:sub_building, 
      "Organisation" =>:organisation, 
      "Street" =>:street, 
      "SubStreet" =>:sub_street, 
      "Town" =>:town, 
      "District" =>:district
    }
  end
  
end





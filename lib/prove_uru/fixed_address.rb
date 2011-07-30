class ProveUru::FixedAddress
  attr_accessor :postcode, :building_name :building_no, :sub_building, :organisation, :street, :sub_street, :town, :district
  
  def to_prove_hash
    {
      "Postcode" => self.postcode, 
      "BuildingName" => self.building_name, 
      "BuildingNo" => self.building_no, 
      "SubBuilding" => self.sub_building, 
      "Organisation" => self.organisation, 
      "Street" => self.street, 
      "SubStreet" => self.sub_street, 
      "Town" => self.town, 
      "District" => self.district
    }
  end
  
end





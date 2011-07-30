class ProveUru::UkData
  attr_accessor :address1, :address2, :address3, :address4
  
  def to_prove_hash
    return_hash = {}
    
    return_hash = return_hash.merge!({"Address1" => self.address1.to_prove_hash}) unless self.address1.nil?
    return_hash = return_hash.merge!({"Address2" => self.address2.to_prove_hash}) unless self.address2.nil?
    return_hash = return_hash.merge!({"Address3" => self.address3.to_prove_hash}) unless self.address3.nil?
    return_hash = return_hash.merge!({"Address4" => self.address4.to_prove_hash}) unless self.address4.nil?
    
    return_hash
  end
  
end
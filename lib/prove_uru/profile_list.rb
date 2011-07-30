class ProveUru::ProfileList
  def self.get_profile_list
    client = ProveUru.create_client
    
    response = client.request :prove, :get_profiles do
      soap.body = ProveUru.merge_prove_password_hash({})
    end
    
    list = Array.new
    
    response = response.to_hash
    response[:get_profiles_response][:get_profiles_result][:uru_profile5].each do |p|
      puts p
      list << ::ProveUru::Profile.new(p)
    end

    list
  end
end
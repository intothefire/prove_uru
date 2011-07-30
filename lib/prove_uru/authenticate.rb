class ProveUru::Authenticate
  def self.process(profile_id, user_data, uk_data)
    client = ProveUru.create_client
    
    response = client.request :prove, :authenticate_by_profile do
      soap.body = ProveUru.merge_prove_password_hash({
        "ProfileId" => profile_id,
        "UserData" => {
          "Basic" => user_data.to_prove_hash()
        }
      })
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
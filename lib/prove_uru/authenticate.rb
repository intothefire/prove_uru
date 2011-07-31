class ProveUru::Authenticate
  def self.process(profile_id, user_data, uk_data)
    client = ProveUru.create_client
    
    response = client.request :prove, :authenticate_by_profile do
      soap.body = ProveUru.merge_prove_password_hash({
        "ProfileId" => profile_id,
        "UserData" => {
          "Basic" => user_data.to_prove_hash,
          "UKData" => uk_data.to_prove_hash
        }
      })
    end
    
    response = response.to_hash
    ::ProveUru::AuthenticationResult.new(response[:authenticate_by_profile_response][:authenticate_by_profile_result])
  end
end
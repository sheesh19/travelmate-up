FactoryBot.define do

    factory(:user) do
        email { 'user@user.com' }
        password { 'password' }
    end
    
    factory(:trip) do
        title { 'Test Trip' }
        start_date { Date.now + 30.days }
        end_date { Date.now + 40.days }
        user
    end

    factory(:activity) do
        title { 'Test Activity' }
    end
end
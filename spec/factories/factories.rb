FactoryBot.define do

    factory(:activity) do
        title { 'Snorkeling' }
    end

    factory(:trip) do
        title { 'Test Trip' }
        start_date { Date.today + 30.days }
        end_date { Date.today + 40.days }
        user
    end

    factory(:user) do
        email { 'user@user.com' }
        password { 'password' }
    end
    
end
FactoryGirl.define do
	factory :reservation do
		start_at Time.now
		end_at 2.hours.from_now
		table_number 10
	end
end

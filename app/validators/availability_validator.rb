class AvailabilityValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    trips = Trip.where(["user_id =?", record.user])
    events = Event.where()
    events = Event.where(["user_id =?", record.user])
    date_ranges = events.map { |b| b.start_date..b.end_date }

    date_ranges.each do |range|
      if range.include? value
        record.errors.add(attribute, "not available")
      end
    end
  end
end

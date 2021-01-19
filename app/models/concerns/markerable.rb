module Markerable
    extend ActiveSupport::Concern

    def single_marker
        # marker for the event
        
        [{
            lat: latitude,
            lng: longitude,
            # image_url: helpers.asset_url('REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS')
        }]
    end

    def markers
        # markers for the trip map

        events.map do |event|
            {
                lat: event.latitude,
                lng: event.longitude,
                # image_url: helpers.asset_url('REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS')
                # infoWindow: render_to_string(partial: "shared/infowindow", locals: { event: event.title })
            }
        end
    end

    module ClassMethods
        def all_markers
            # markers for all events map

            @markers = self.all.map do |event|
                {
                    lat: event.latitude,
                    lng: event.longitude,
                    #infoWindow: render_to_string(partial: "shared/infowindow", locals: { event: event.title })
                }
            end
        end
    end
end
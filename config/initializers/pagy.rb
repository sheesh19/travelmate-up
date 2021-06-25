require 'pagy/extras/bootstrap'

# Return 25 records per page.
Pagy::VARS[:items] = 15

# Change to layout of the paginator nav bar.
Pagy::VARS[:size] = [1,2,2,1]
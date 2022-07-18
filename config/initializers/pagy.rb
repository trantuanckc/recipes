require 'pagy/extras/searchkick'

Searchkick.extend Pagy::Searchkick
Pagy::DEFAULT[:items] = 25

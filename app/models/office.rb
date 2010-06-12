class Office < ActiveRecord::Base
  belongs_to :location, :dependent => :destroy

end

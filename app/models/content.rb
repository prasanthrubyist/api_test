class Content < ApplicationRecord
   validates_presence_of :title, :author, :published_date	
end

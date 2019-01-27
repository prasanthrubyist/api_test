class Content < ApplicationRecord
	cache key: 'content'
	attributes :id, :title, :author, :published_date, :summary, :content, :status

   validates_presence_of :title, :author, :published_date	
end

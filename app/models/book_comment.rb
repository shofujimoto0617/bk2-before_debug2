class BookComment < ApplicationRecord
	#userの関連付け
	belongs_to :user
	#bookの関連付け
	belongs_to :book
end

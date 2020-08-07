class Book < ApplicationRecord
	belongs_to :user
	#いいねの関連付け
	has_many :favorites, dependent: :destroy
	#コメントの関連付け
	has_many :book_comments, dependent: :destroy

	#バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
	#presence trueは空欄の場合を意味する。
	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}

	#いいねを押しているか判断
	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
end

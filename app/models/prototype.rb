class Prototype < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy  # prototype削除時に関連コメントも削除
  has_one_attached :image
  validates :name, :catch_copy, :concept, presence: true
  validates :image, presence: { message: 'を入力してください' }
end
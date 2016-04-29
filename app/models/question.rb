class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :answers,  dependent: :destroy
  accepts_nested_attributes_for :answers,
                                reject_if: proc {|attributes| attributes['content'].blank?},
                                allow_destroy: true

  validates :content, presence: true
  validates :question_type, presence: true

  def to_s
    content
    question_type
  end
end

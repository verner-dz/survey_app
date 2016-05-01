class Survey < ActiveRecord::Base
  has_many :questions, -> { order(:position) }, dependent: :destroy
  has_many :responses, dependent: :destroy
  accepts_nested_attributes_for :questions,
                                reject_if: proc {|attributes| attributes['content'].blank?},
                                allow_destroy: true
  validates :name, presence: true

  def to_s
    name
  end
end

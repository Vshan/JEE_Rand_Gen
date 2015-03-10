class Topiccode < ActiveRecord::Base
  validates :tcode, :tname, :scode_id, :active, presence: true
  validates :tname, uniqueness: true
  belongs_to :scode
  has_many :subtopiccode
end

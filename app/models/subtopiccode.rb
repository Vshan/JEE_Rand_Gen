class Subtopiccode < ActiveRecord::Base
  validates :stcode, :stname, :topiccode_id, :active, presence: true
  validates :stname, uniqueness: true
  belongs_to :topiccode
end

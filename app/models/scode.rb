class Scode < ActiveRecord::Base
  validates :scode, :sname, presence: true
  validates :sname, uniqueness: true
  has_many :topiccode
end

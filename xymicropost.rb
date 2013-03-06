class Micropost < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user

  validates :content, presence: true, length: { maximum: 140 }
  #validates( :content, {:presence => true}, {:length => { maximum: 140 }})
  validates( :user_id, {:presence => true} ) ## validates :user_id, presence: true
 
  ## show microposts in descent order, latest first
  default_scope order: 'microposts.created_at DESC'
end

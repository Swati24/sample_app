# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  state      :string(255)
#

class Article < ActiveRecord::Base
	include AASM
  attr_accessible :content, :title, :user_id

  validates_presence_of :title, :content

  belongs_to :user, :counter_cache => true

  aasm_column :state
  aasm do
    state :drafted, :initial => true
    state :published
    state :unpublished

    event :publish do
      transitions :from => :drafted, :to => :published
    end

    event :unpublish do
      transitions :from => :published, :to => :unpublished
    end
  end

  def self.valid_draft_articles(user)
    if user.role? :reporter
      drafted.where('user_id = ?', user.id)
    else
     drafted
    end
  end
end

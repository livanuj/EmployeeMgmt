class Issue < ApplicationRecord  

	scope :finished, ->{ where('finished_at IS NOT NULL') }

  validates :issue, presence: true
end

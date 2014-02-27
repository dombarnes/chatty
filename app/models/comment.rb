class Comment < ActiveRecord::Base
	belongs_to :room, :polymorphic => true

	validates :comment, :presence => true

	default_scope { order('created_at DESC') }
end

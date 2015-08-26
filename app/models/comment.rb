class Comment < ActiveRecord::Base
	belongs_to :room, :polymorphic => true

	validates_presence_of :comment, :name

	default_scope { order('created_at DESC') }
end

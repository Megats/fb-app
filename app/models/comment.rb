class Comment < ApplicationRecord
    has_many :likes, as: :likeable
    belongs_to :user
    delegate :user_name, to: :user

    after_create_commit {broadcast_prepend_to "comment"}
    after_update_commit {broadcast_replace_to "comment"}
    after_destroy_commit {broadcast_remove_to "comment"}
end

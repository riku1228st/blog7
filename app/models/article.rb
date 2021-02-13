class Article < ApplicationRecord
    mount_uploader :image, ImagesUploader
    acts_as_taggable
    acts_as_taggable_on :skills, :interests
end

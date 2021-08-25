class SaveVideo < ApplicationRecord
    mount_uploader :file_name, AvatarUploader
end

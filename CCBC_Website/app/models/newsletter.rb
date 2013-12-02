class Newsletter < ActiveRecord::Base
  mount_uploader :pdf, PdfUploader
end

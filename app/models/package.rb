class Package < ApplicationRecord
	belongs_to :service, optional: true
end
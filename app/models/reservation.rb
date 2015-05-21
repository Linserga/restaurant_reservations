class Reservation < ActiveRecord::Base
	validates :table_number, presence: true
	validates :start_at, presence: true
	validates :end_at, presence: true
	validates :start_at, :end_at, overlap: { scope: 'table_number'}
end

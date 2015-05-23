class Reservation < ActiveRecord::Base
	validates :table_number, presence: true
	validates :start_at, presence: true
	validates :end_at, presence: true
	# validates :start_at, :end_at, overlap: { scope: 'table_number'}
	scope :overlaps, ->(start_at, end_at, table_number) { where('start_at <= ? AND end_at >= ? AND table_number = ?', end_at, start_at, table_number)}

	validate :not_overlap

	private

		def overlaps
			Reservation.overlaps self.start_at, self.end_at, self.table_number
		end

		def overlaps?
			overlaps.exists?	
		end

		def not_overlap
			errors.add(:reservation, 'Overlaps!') if overlaps?
		end

end

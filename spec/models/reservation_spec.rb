require 'rails_helper'

RSpec.describe Reservation, type: :model do
  let(:reservation) {FactoryGirl.create(:reservation)}
  subject { reservation }
  
  # it { should be_valid }

  context 'it should not be valid with empty start date' do
  	before { reservation.start_at = nil }

  	it { should be_invalid }
  end

  context 'it should not be valid with empty end date' do
  	before { reservation.end_at = nil }

  	it { should be_invalid }
  end

  context 'it should not be valid without table_number' do
  	before { reservation.table_number = nil }

  	it { should be_invalid }
  end

  it 'should not be valid with reservation that overlaps current' do
  	dup = reservation.dup 	

  	expect(dup).to be_invalid
  end

  it 'should be valid with reservation that overlaps current for other table' do
  	dup = reservation.dup 	
  	dup.table_number = 4

  	expect(dup).to be_valid
  end
end

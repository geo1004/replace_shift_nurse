require 'rails_helper'

RSpec.describe Shift, :type => :model do
  let(:current_user) {create(:user) }
  let(:user) {create(:user) }
  let(:base_shift) do
    create :shift,
    :available,
    user: current_user,
    start_date: DateTime.new(2014, 12, 1),
    end_date: DateTime.new(2014, 12, 10)
  end
  let(:fully_included_shift) do
    create :shift,
    :available,
    user: user,
    start_date: DateTime.new(2014, 12, 1),
    end_date: DateTime.new(2014, 12, 10)
  end
  let(:partially_included_shift) do
    create :shift,
    :available,
    user: user,
    start_date: DateTime.new(2014, 12, 5),
    end_date: DateTime.new(2014, 12, 7)
  end
  let(:not_included_shift) do
    create :shift,
    :available,
    user: user,
    start_date: DateTime.new(2014, 12, 12),
    end_date: DateTime.new(2014, 12, 14)
  end

  before do
    @available_shift = create(:shift, :available, user: user)
    @seeking_shift = create(:shift, :seek, user: user)
  end

  describe '#availabilities' do
    it 'returns only available type shifts' do
      expect(Shift.availabilities).to eq([@available_shift])
    end
  end
  describe '#seekings' do
    it 'returns only seeking type shifts' do
      expect(Shift.seekings).to eq([@seeking_shift])
    end
  end
  describe '#exclude_user' do
    it 'filter out the user passed in argument' do
      expect(Shift.exclude_user(user)).to eq([])
    end
  end
  describe '#date_fully_included?' do
    it { expect(base_shift.date_fully_included?(fully_included_shift)).to eq(true) }
    it { expect(base_shift.date_fully_included?(partially_included_shift)).to eq(false) }
    it { expect(base_shift.date_fully_included?(not_included_shift)).to eq(false) }
  end

  describe '#date_partially_included?' do
    it { expect(base_shift.date_partially_included?(fully_included_shift)).to eq(true) }
    it { expect(base_shift.date_partially_included?(partially_included_shift)).to eq(true) }
    it { expect(base_shift.date_partially_included?(not_included_shift)).to eq(false) }
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  context 'when the current_user is looking for vacation' do
    describe '#full_matches' do
      it 'sends the #user_matching method with the search_include :full and type :seekings' do
        expect(user).to receive(:user_matching).with(:full, :seekings)
        user.full_matches(type: :seekings)
      end
    end

    describe '#partial_matches' do
      it 'sends the #user_matching method with the type :partial and type :seekings' do
        expect(user).to receive(:user_matching).with(:partial, :seekings)
        user.partial_matches(type: :seekings)
      end
    end

    describe '#user_matching' do
      let(:user_seeking_job) { create(:user) }
      let(:user_who_want_vacation) { create(:user) }

      context 'when there is full matching' do
        let!(:seeking_shift) do
          create(:shift, :seek, user: user_who_want_vacation)
        end
        let!(:availability_shift) do
          create(:shift, :available, user: user_seeking_job)
        end

        it 'returns the user who fully match' do
          expect(user_who_want_vacation.send(:user_matching, :full, :seekings)).to eq([user_seeking_job])
        end
      end

      context 'when there is partial matching' do
        let!(:seeking_shift) do
          create :shift,
                 :seek,
                 user: user_who_want_vacation,
                 start_date: DateTime.new(2014, 12, 20),
                 end_date: DateTime.new(2014, 12, 30)
        end
        let!(:availability_shift) do
          create :shift,
                 :available,
                 user: user_seeking_job,
                 start_date: DateTime.new(2014, 12, 25),
                 end_date: DateTime.new(2014, 12, 30)
        end

        it 'returns the user who partially match' do
          expect(user_who_want_vacation.send(:user_matching, :partial, :seekings)).to eq([user_seeking_job])
        end
      end

      context 'when there is NO matching' do
        let!(:seeking_shift) do
          create(:shift, :seek, user: user_who_want_vacation)
        end
        let!(:availability_shift) do
          create :shift,
                 :available,
                 user: user_seeking_job,
                 start_date: DateTime.new(2014, 01, 01),
                 end_date: DateTime.new(2014, 01, 02)
        end

        it 'returns [] who match' do
          expect(user_who_want_vacation.send(:user_matching, :full, :seekings)).to eq([])
        end
      end
    end
  end

  context 'when the current_user is looking for vacation' do
    describe '#full_matches' do
      it 'sends the #user_matching method with the search_include :full and type :availabilities' do
        expect(user).to receive(:user_matching).with(:full, :availabilities)
        user.full_matches(type: :availabilities)
      end
    end

    describe '#partial_matches' do
      it 'sends the #user_matching method with the type :partial and type :availabilities' do
        expect(user).to receive(:user_matching).with(:partial, :availabilities)
        user.partial_matches(type: :availabilities)
      end
    end

    describe '#user_matching' do
      let(:user_seeking_job) { create(:user) }
      let(:user_who_want_vacation) { create(:user) }

      context 'when there is matching' do
        let!(:seeking_shift) do
          create(:shift, :seek, user: user_who_want_vacation)
        end
        let!(:availability_shift) do
          create(:shift, :available, user: user_seeking_job)
        end

        it 'returns the user who match' do
          expect(user_seeking_job.send(:user_matching, :full, :availabilities)).to eq([user_who_want_vacation])
        end
      end

      context 'when there is NO matching' do
        let!(:seeking_shift) do
          create :shift,
                 :seek,
                 user: user_who_want_vacation,
                 start_date: DateTime.new(2014, 01, 01),
                 end_date: DateTime.new(2014, 01, 02)
        end
        let!(:availability_shift) do
          create :shift,
                 :available,
                 user: user_seeking_job
        end

        it 'returns [] who match' do
          expect(user_seeking_job.send(:user_matching, :full, :availabilities)).to eq([])
        end
      end
    end
  end

  describe '#contrary(type)' do
    context 'when type is :seekings' do
      it 'returns "availabilities"' do
        expect(user.send(:contrary, :seekings)).to eq("availabilities")
      end
    end
    context 'when type is :availabilities' do
      it 'returns "seekings"' do
        expect(user.send(:contrary, :availabilities)).to eq("seekings")
      end
    end
  end
end

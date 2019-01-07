# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BodyMass do
  let(:user) { build :user, weight: 80.0, height: 2.0 }

  subject do
    BodyMass.new weight: user.weight, height: user.height
  end

  describe '#index' do
    it 'calculates the body mass index' do
      expect(subject.index).to eq(20.0)
    end
  end

  describe '#category' do
    context 'when index is 15 or less' do
      before { allow(subject).to receive(:index) { 15 } }

      it { expect(subject.category).to eq(:very_severely_underweight) }
    end

    context 'when index is 16 or less' do
      before { allow(subject).to receive(:index) { 16 } }

      it { expect(subject.category).to eq(:severely_underweight) }
    end

    context 'when index is 18.5 or less' do
      before { allow(subject).to receive(:index) { 18.5 } }

      it { expect(subject.category).to eq(:underweight) }
    end

    context 'when index is 25 or less' do
      before { allow(subject).to receive(:index) { 25 } }

      it { expect(subject.category).to eq(:normal) }
    end

    context 'when index is 30 or less' do
      before { allow(subject).to receive(:index) { 30 } }

      it { expect(subject.category).to eq(:overweight) }
    end

    context 'when index is 35 or less' do
      before { allow(subject).to receive(:index) { 35 } }

      it { expect(subject.category).to eq(:moderately_obese) }
    end

    context 'when index is 40 or less' do
      before { allow(subject).to receive(:index) { 40 } }

      it { expect(subject.category).to eq(:severely_obese) }
    end

    context 'when index is 45 or less' do
      before { allow(subject).to receive(:index) { 45 } }

      it { expect(subject.category).to eq(:very_severely_obese) }
    end

    context 'when index is 50 or less' do
      before { allow(subject).to receive(:index) { 50 } }

      it { expect(subject.category).to eq(:morbidly_obese) }
    end

    context 'when index is 60 or less' do
      before { allow(subject).to receive(:index) { 60 } }

      it { expect(subject.category).to eq(:super_obese) }
    end

    context 'when index over 60' do
      before { allow(subject).to receive(:index) { 60.1 } }

      it { expect(subject.category).to eq(:hyper_obese) }
    end
  end
end

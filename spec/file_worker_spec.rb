require './lib/file_worker'

RSpec.describe FileWorker do
  context 'initialize' do
    worker = FileWorker.new('message.txt', 'encrypted.txt', :encryption)

    it 'exists' do
      expect(worker).to be_a(FileWorker)
    end

    it 'has attributes' do
      expect(worker.method).to eq(:encryption)
    end

    it 'responds to the proper methods' do
      expect(worker).to respond_to(:read_file)
      expect(worker).to respond_to(:write_to_file)
      expect(worker).to respond_to(:output)
      expect(worker).to respond_to(:formatted_output)
    end
  end
end

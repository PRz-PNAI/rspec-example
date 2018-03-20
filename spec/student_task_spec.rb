require './lib/student_task.rb'
require './lib/student.rb'


describe StudentTask do

  let(:title) { "Bardzo trudne zadanie" }
  subject(:task) { StudentTask.new title }

  it { should_not be_assigned }

  describe "#to_s" do
    it "includes task title" do
      expect(task.to_s).to match /#{title}/
    end
  end

  describe "#student" do
    it "returns nil" do
      expect(task.student).to be(nil)
    end
  end

  context "while assigning" do
    let(:student) { "Jan Kowalski" }
    it "checks if the student exists" do
      expect(Student).to receive(:exists?).with(student).and_return(true)
      task.assign student
    end

    context "when no such student" do
      before do
        allow(Student).to receive(:exists?).with(student).and_return(false)
      end

      it "raises error" do
        expect {
          task.assign student
        }.to raise_error /No such student/
      end
    end

    context "when student exists" do
      before do
        allow(Student).to receive(:exists?).with(student).and_return(true)
      end

      it "does not raise error" do
        expect {
          task.assign student
        }.not_to raise_error
      end

    end
  end

  context "when assigned" do
    let(:student) { "Jan Kowalski" }
    subject(:task) do
      t = StudentTask.new title
      t.assign student
      t
    end

    before do
      allow(Student).to receive(:exists?).and_return(true)
    end

    it { should be_assigned }

    describe "#to_s" do
      it "returns assigned student" do
        expect(subject.to_s).to match /#{student}/
      end
    end

    describe "#student" do
      it "returns assigned student" do
        expect(subject.student).to equal student
      end
    end
  end

end

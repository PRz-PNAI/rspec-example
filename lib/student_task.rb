class StudentTask

  def initialize(title)
    @title = title
  end

  def to_s
    "Zadanie: #{@title}, Wykonawca: #{@student}"
  end

  def student
    @student
  end

  def assign(student)
    @student = student
  end

  def assigned?
    !@student.nil?
  end

end

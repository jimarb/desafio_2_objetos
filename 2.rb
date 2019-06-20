require 'date'
class Course
    attr_reader :course
    def initialize(course_name, start_date, end_date)
        @course_name = course_name
        @start_date = Date.parse(start_date)
        @end_date = Date.parse(end_date)
    end
    def course_before_date(target_date)
        raise ArgumentError.new('Argument is not a date') if target_date.class != Date
        # filter_dates = @start_date.select {|date| date < target_date}
        puts "El curso de #{@course_name} inicia el #{@start_date}" if @start_date < target_date
    end
    def course_after_date(target_date)
        raise ArgumentError.new('Argument is not a date') if target_date.class != Date
        # @end_date.select {|date| date > target_date}
        puts "El curso de #{@course_name} finaliza el #{@end_date}" if @end_date > target_date
    end
end
courses = []
file = File.open('cursos.txt', 'r')
data = file.readlines
file.close
data.each do |lines|
    course_name, start_date, end_date = lines.split(', ')
    courses << Course.new(course_name, start_date, end_date)
end

courses.each do |course|
    course.course_before_date(Date.today)
    course.course_after_date(Date.today)
end


    




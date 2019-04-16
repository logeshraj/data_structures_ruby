# Definition for an interval.
# class Interval
#     attr_accessor :start, :end
#     def initialize(s=0, e=0)
#         @start = s
#         @end = e
#     end
# end

# @param {Interval[]} intervals
# @return {Interval[]}

class Interval
  def <=>(other)
    self.start <=> other.start
  end
end

def merge(intervals)
  sorted_intervals = intervals.sort
  i = 0 
  while(i+1 < sorted_intervals.length)
    if sorted_intervals[i+1].start <= sorted_intervals[i].end
      sorted_intervals[i].end = sorted_intervals[i+1].end if sorted_intervals[i+1].end >= sorted_intervals[i].end
      sorted_intervals.delete_at i+1
    else
      i+=1
    end 
  end
  sorted_intervals
end
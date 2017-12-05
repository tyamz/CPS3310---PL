from __future__ import division
import sys
import math

def main():
  num_list = [3,6,7,2,8,9,2,3,7,4,5,9,2,1,6,9,6]

  def mean(lst):
      avg = 0
      for i in range(len(lst)):
          avg += lst[i]
      return (avg / len(lst))

  def median(lst):
      x = len(lst)
      if x < 1:
          return None
      if x % 2 == 1:
          return sorted(lst)[x//2]
      else:
          return sum(sorted(lst)[x//2-1:x//2+1])/2.0

  def stdev(lst):
      avg = mean(lst)
      top = 0
      for i in range(len(lst)):
          top += (lst[i] - avg) * (lst[i] - avg)
      stdev = (top / len(lst))
      return math.sqrt(stdev)

  print("The mean of these numbers is: ", mean(num_list))
  print("The median of these numbers is: ", median(num_list))
  print("The standard deviation of these numbers is: ", stdev(num_list))
main() # Call the main function

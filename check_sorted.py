import sys
nums = []
for line in sys.stdin:
    nums.append(int(line))
if nums == sorted(nums):
    print("Array is sorted")
else:
    print("Array is NOT sorted")

import sys
nums = []
for line in sys.stdin:
    nums.append(int(line))
last = nums[-1]
if nums[:-1] == sorted(nums[:-1]):
    print("Array is sorted")
else:
    print("Array is NOT sorted")
if last == sum(nums[:-1]):
    print("Sum calculated correctly")
else:
    print("Sum calculated INCORRECTLY")

import sys
nums = []
for line in sys.stdin:
    for val in line.split(" "):
        if val in ["", "\n"]:
            continue
        nums.append(int(val))
last = nums[-1]
if nums[:-1] == sorted(nums[:-1]):
    print("Array is sorted")
else:
    print("Array is NOT sorted")
if last == sum(nums[:-1]):
    print("Sum calculated correctly")
else:
    print("Sum calculated INCORRECTLY")

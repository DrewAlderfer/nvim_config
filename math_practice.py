import numpy as np
my_list = [19, 18, 21, 16, 15, 17, 20, 18]
q2 = [22, 56, 11, 4, -17, 6, 80, -126]

def mean(i_arr):
    result = 0
    for x in i_arr:
        result += x
    result = result/len(i_arr)
    return result

def median(data):
    
    s_data = sorted(data)
    median_tup = divmod(len(s_data), 2)
    if median_tup[1]:
        return s_data[median_tup[0]]
    else:
        result = s_data[median_tup[0]]+s_data[median_tup[0]-1]
        result = result/2
        return result

def mode(data):
    result = []
    d_data = {}
    for x in data:
        x_count = data.count(x)
        d_data[x] = x_count

    for x in d_data.items():
       for v in x:
           if v == max(d_data.values()):
               result.append(x[0])
    return result

def covariance(x, y):
    result = 0
    to_sum = []
    if len(x) == len(y):
        x_mean = mean(x)
        y_mean = mean(y)

        for i, v in enumerate(x):
            x_variance = v - x_mean
            y_variance = y[i] - y_mean
            to_sum.append(x_variance * y_variance)

        result = sum(to_sum)/(len(x) - 1)
        return result
    else:
        return None

def r_value(x, y):
    cov_xy = covariance(x, y)
    sum_of_x_sq = 0
    sum_of_y_sq = 0
    for i, v in enumerate(x):
        sum_of_x_sq += (v - mean(x))**2
        sum_of_y_sq += (y[i] - mean(y))**2 
    
    xstd_dev = sum_of_x_sq / (len(x)-1)
    ystd_dev = sum_of_y_sq / (len(y)-1)
    sqrt_std_xy = np.sqrt(xstd_dev * ystd_dev)
    result = cov_xy / sqrt_std_xy    

    return result

test_set = [11, 23, 45, 1, 45, -23, 44, 25, 67, 33, 45, 13, 87]
test_set_two = [332, 123, 456, 678, 234, 45, 632, 1200, 342 ,876, 654, 98, 123]

print("Answer:")
print(18/21)
for x in range(6):
    print(x + 2)
x = "789"
print(type(x[2]))
print("hello, world!".title()!="hello, world!")
def upper_slice(text, number):
    return text[:number].upper()

print(upper_slice("Hello", 2def upper_slice(text, number):
    return text[:number].upper()))

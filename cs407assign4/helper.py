import numpy as np
import matplotlib.pyplot as plt

def ewma(data, a):
    new_data = []
    new_data.append(data[0])
    for i in range(1, len(data)):
        new_data.append(a * data[i] + (1 - a) * new_data[i-1])
    return new_data


def smooth(data, a):
    new_data = []

    sum = 0
    for i in range(0, a):
        sum += data[i]

    for i in range(0, a):
        new_data.append(sum / a)

    for i in range(a, len(data)):
        sum = 0
        for j in range(0, a):
            sum += data[i - j]
        new_data.append(sum / a)
    return new_data


def divide_data(data_time, threshold):
    starts = []
    starts.append(0)
    ends = []

    i = 0
    while i < len(data_time):
        if abs(data_time[i]) > threshold:
            # for j in range(0, i):
            #     if abs(data_time[i - j]) < threshold / 10:
            #         ends.append(i - j)
            #         break
            # for j in range(0, len(data_time) - i):
            #     if abs(data_time[i + j]) < threshold / 10:
            #         starts.append(i + j)
            #         i += j
            #         break
            ends.append(i)
            for j in range(0, len(data_time) - i):
                if abs(data_time[i + j]) < threshold:
                    starts.append(i + j)
                    i += j
                    break
        i += 1

    ends.append(len(data_time))
    return starts, ends


def offset_data(data_time, data_a_x, data_a_y, starts, ends):
    for i in range(0, len(starts)):
        start = starts[i]
        end = ends[i]

        sumx = 0.0
        sumy = 0.0

        for j in range(start + 1, end):
            sumx += (data_time[j] - data_time[j - 1]) / 1000 * data_a_x[j]
            sumy += (data_time[j] - data_time[j - 1]) / 1000 * data_a_y[j]

        offsetx = sumx / ((data_time[end-1] - data_time[start]) / 1000)
        offsety = sumy / ((data_time[end-1] - data_time[start]) / 1000)

        for j in range(start + 1, end):
            data_a_x[j] -= offsetx
            data_a_y[j] -= offsety


def set_move_period(data_a_x, data_a_y, data_a_z):
    np_a_x = np.array(data_a_x)
    np_a_y = np.array(data_a_y)
    np_a_z = np.array(data_a_z)

    np_a_x -= np.average(data_a_x)
    np_a_y -= np.average(data_a_y)
    np_a_z -= np.average(data_a_z)

    # plt.plot((np_a_x / np_a_z).__array__())
    # plt.show()

    starts_x, ends_x = divide_data((np_a_x / np_a_z).__array__(), 20)
    for i in range(0, len(starts_x)):
        for j in range(starts_x[i], ends_x[i]):
            np_a_x[j] = 1e-10

    starts_y, ends_y = divide_data((np_a_y / np_a_z).__array__(), 20)
    for i in range(0, len(starts_y)):
        for j in range(starts_y[i], ends_y[i]):
            np_a_y[j] = 1e-10

    plt.plot(np_a_x.__array__())
    plt.show()

    return np_a_x.__array__(), np_a_y.__array__()
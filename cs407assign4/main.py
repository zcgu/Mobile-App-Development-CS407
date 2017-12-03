import file_reader
import status_class
import helper
import matplotlib.pyplot as plt

dataset1 = 'RightTurnData.csv'
dataset2 = 'MultipleTurnData_1.csv'
dataset3 = 'MultipleTurnData_2.csv'

data_time, data_a_x, data_a_y, data_a_z, data_d_z = file_reader.read_data(dataset3)

status = status_class.Status()

xs = []
ys = []
angle = []

starts, ends = helper.divide_data(data_d_z, 0.1)

# data_a_x = helper.smooth(data_a_x, 1)
# data_a_y = helper.smooth(data_a_y, 1)
# data_a_x = helper.ewma(data_a_x, 0.1)
# data_a_y = helper.ewma(data_a_y, 0.1)
helper.offset_data(data_time,data_a_x,data_a_y,starts,ends)
# data_a_x, data_a_y = helper.set_move_period(data_a_x, data_a_y, data_a_z)

for i in range(1, len(data_time)):

    status.move(data_time[i] - data_time[i-1], data_a_x[i], data_a_y[i], data_d_z[i])

    print status
    xs.append(status.position.x)
    ys.append(status.position.y)
    angle.append(status.direction.angle * 180 / 3.14159)

xs2 = []
ys2 = []
for item in starts:
    xs2.append(xs[item])
    ys2.append(ys[item])
xs2.append(xs[len(xs) - 1])
ys2.append(ys[len(ys) - 1])

plt.plot(xs, ys)
plt.plot(xs2, ys2)
plt.show()

plt.plot(helper.smooth(data_d_z, 50))
plt.show()

plt.plot(helper.smooth(angle, 50))
plt.show()

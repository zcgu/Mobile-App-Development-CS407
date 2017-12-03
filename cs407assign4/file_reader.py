import csv


def is_number(s):
    try:
        float(s)
        return True
    except ValueError:
        return False


def is_data_line(line):
    for line_item in line:
        if not is_number(line_item):
            return False
    return True


def read_data(file_name):
    data = []

    with open(file_name, "rb") as infile:
        reader = csv.reader(infile, delimiter=",")
        for line in reader:
            if is_data_line(line):
                line_float = []
                for line_item in line:
                    line_float.append(float(line_item))
                data.append(line_float)

    data_time = []
    data_a_x = []
    data_a_y = []
    data_a_z = []
    data_d_z = []
    for data_item in data:
        data_time.append(data_item[6])
        data_a_x.append(data_item[0])
        data_a_y.append(data_item[1])
        data_a_z.append(data_item[2])
        data_d_z.append(data_item[5])

    return data_time, data_a_x, data_a_y, data_a_z, data_d_z

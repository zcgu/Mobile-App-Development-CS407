import math


class Position:

    def __init__(self):
        self.x = 0.0
        self.y = 0.0

    def __str__(self):
        return '(' + str(self.x) + ', ' + str(self.y) + ')'

    def move(self, milliseconds, d_xy, a_xy):
        second = milliseconds / 1000
        self.x += d_xy[0] + 0.5 * a_xy[0] * second * second
        self.y += d_xy[1] + 0.5 * a_xy[1] * second * second


class Direction:

    def __init__(self):
        self.angle = 0.0

    def __str__(self):
        return str(self.angle * 180 / math.pi)

    def rotate(self, millisecond, d_z_angle):
        second = millisecond / 1000
        rad = second * d_z_angle
        self.angle += rad

    def get_a_xy(self, a_x, a_y):
        if a_x > 0:
            tan = math.atan(a_y / a_x)
        else:
            tan = math.atan(a_y / a_x) + math.pi
        new_tan = tan + self.angle

        return math.pow(a_x * a_x + a_y * a_y, 0.5) * math.cos(new_tan), \
               math.pow(a_x * a_x + a_y * a_y, 0.5) * math.sin(new_tan)


class Velocity:

    def __init__(self):
        self.v_x = 0.0
        self.v_y = 0.0

    def __str__(self):
        return '(' + str(self.v_x) + ', ' + str(self.v_y) + ')'

    def get_move_distance(self, millisecond):
        second = millisecond / 1000.0
        d_x = self.v_x * second
        d_y = self.v_y * second
        return d_x, d_y

    def add(self, millisecond, a_xy):
        second = millisecond / 1000.0
        self.v_x += a_xy[0] * second
        self.v_y += a_xy[1] * second


class Status:

    def __init__(self):
        self.position = Position()
        self.velocity = Velocity()
        self.direction = Direction()

    def __str__(self):
        return 'Position: ' + self.position.__str__() + ', Velocity: ' + self.velocity.__str__() + ', Angle: ' \
               + self.direction.__str__()

    def move(self, millisecond, a_x, a_y, d_z_angle):

        if abs(d_z_angle) < 0.1:
            self.position.move(millisecond, self.velocity.get_move_distance(millisecond), self.direction.get_a_xy(a_x, a_y))
            self.velocity.add(millisecond, self.direction.get_a_xy(a_x, a_y))
        else:
            self.direction.rotate(millisecond, d_z_angle)

#https://stackoverflow.com/questions/37373211/update-the-global-variable-in-rospy


import rospy
from std_msgs.msg import String
from sensor_msgs.msg import NavSatFix, NavSatStatus, TimeReference
from ublox_dog_msgs.msg import NavPOSECEF

class Nodo(object):
    def __init__(self):
        # Params
        self.x1 = 0.0
        self.y1 = 0.0

        self.x2 = 0.0
        self.y2 = 0.0
        #self.a = None

        self.newX = 0.0
        self.newY = 0.0

        # Node cycle rate (in Hz).
        self.loop_rate = rospy.Rate(1)

        # Publishers
        #self.pub = rospy.Publisher("~chatter1", std_msgs.msg.Float64, queue_size=10)

        # Subscribers
        #rospy.Subscriber("/ublox_dog_gps/fix", NavSatFix, callback_dog)
        rospy.Subscriber("/ublox_dog_gps/navposecef", NavPOSECEF, self.callback_dog_navposecef)    
        #rospy.Subscriber("/ublox_snout_gps/fix", NavSatFix, callback_snout)
        rospy.Subscriber("/ublox_snout_gps/navposecef", NavPOSECEF, self.callback_snout_navposecef)
        

    def callback_dog_navposecef(self, msg):
        #self.a = msg.data
        self.x1 = msg.ecefX
        self.y1 = msg.ecefY
        rospy.loginfo("DOG ecefX: {}".format(msg.ecefX))
        rospy.loginfo("DOG ecefY: {}".format(msg.ecefY))

    def callback_snout_navposecef(self, msg):
        #self.a = msg.data
        self.x2 = msg.ecefX 
        self.y2 = msg.ecefY 
        rospy.loginfo("SNOUT exefX: {}".format(msg.ecefX))
        rospy.loginfo("SNOUT exefY: {}".format(msg.ecefY))

    def start(self):
        rospy.loginfo("COMBINE DOG SNOUT")

        while not rospy.is_shutdown():
                #self.pub.publish(self.x1)
                print("MAIN DOG X1 " + (str)(self.x1))
                print("MAIN DOG Y1 " + (str)(self.y1))
                print "---------" 
                print("MAIN SNOUT X2 " + (str)(self.x2))
                print("MAIN SNOUT Y2 " + (str)(self.y2))

                self.newX = (self.x1 - self.x2)
                self.newY = (self.y1 - self.y2)
                print("NEW X Y " +(str)(self.newX) + " : " + (str)(self.newY))

                self.loop_rate.sleep()

if __name__ == '__main__':
    rospy.init_node("dog_snout", anonymous=True)
    my_node = Nodo()
    my_node.start()

#http://docs.ros.org/en/api/sensor_msgs/html/msg/NavSatFix.html
#combine DOG and SNOUT GPS headings to calculate Heading. Publish heading data somewhere?


import rospy
from std_msgs.msg import String
from sensor_msgs.msg import NavSatFix, NavSatStatus, TimeReference
from ublox_dog_msgs.msg import NavPOSECEF  

dog_poo = 0.0

#Callback function to print the subscribed data on the terminal

def callback_dog(subscribedData):
     #rospy.loginfo("Subscribed: " + subscribedData.data)
     print "hello DOG"
     print ("DOG latitude " + str(subscribedData.latitude))
     print ("DOG longitude " + str(subscribedData.longitude))
     #print subscribedData.latitude

def callback_snout(subscribedData):
     #rospy.loginfo("Subscribed: " + subscribedData.data)
     print "hello SNOUT"
     print ("SNOUT latitude " + str(subscribedData.latitude))
     print ("SNOUT longitude " + str(subscribedData.longitude))

def callback_dog_navposecef(subscribedData):
     #rospy.loginfo("Subscribed: " + subscribedData.data)
     global dog_poo
     print "hello DOG nasposecef"
     print ("DOG ecefX " + str(subscribedData.ecefX))
     print ("DOG ecefY " + str(subscribedData.ecefY))
     dog_poo = subscribedData.ecefY

def callback_snout_navposecef(subscribedData):
     #rospy.loginfo("Subscribed: " + subscribedData.data)
     print "hello SNOUT nasposecef"
     print ("SNOUT ecefX " + str(subscribedData.ecefX))
     print ("SNOUT ecefY " + str(subscribedData.ecefY))

#Subscriber node function which will subscribe the messages from the Topic
def messageSubscriber():
    #initialize the subscriber node called 'messageSubNode'
    rospy.init_node("dog_snout", anonymous=False)
    #This is to subscribe to the messages from the topic named 'messageTopic'
    #rospy.Subscriber("messageTopic", String, callback_str)
    #rospy.Subscriber("/ublox_dog_gps/fix", NavSatFix, callback_dog)
    rospy.Subscriber("/ublox_dog_gps/navposecef", NavPOSECEF, callback_dog_navposecef)


    #rospy.Subscriber("/ublox_snout_gps/fix", NavSatFix, callback_snout)
    rospy.Subscriber("/ublox_snout_gps/navposecef", NavPOSECEF, callback_snout_navposecef)


    #rospy.spin() stops the node from exitind until the node has been shut down
    #rospy.spin()
    while not rospy.is_shutdown():
    # do some work or nothing
        print ("Dog_poo in main " + str(dog_poo))
        rospy.sleep (1) 


if __name__ == "__main__":
    try:
        messageSubscriber()
    except rospy.ROSInterruptException:
        pass

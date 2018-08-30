// Generated by gencpp from file data_manager/bag_updateResponse.msg
// DO NOT EDIT!


#ifndef DATA_MANAGER_MESSAGE_BAG_UPDATERESPONSE_H
#define DATA_MANAGER_MESSAGE_BAG_UPDATERESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace data_manager
{
template <class ContainerAllocator>
struct bag_updateResponse_
{
  typedef bag_updateResponse_<ContainerAllocator> Type;

  bag_updateResponse_()
    {
    }
  bag_updateResponse_(const ContainerAllocator& _alloc)
    {
  (void)_alloc;
    }







  typedef boost::shared_ptr< ::data_manager::bag_updateResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::data_manager::bag_updateResponse_<ContainerAllocator> const> ConstPtr;

}; // struct bag_updateResponse_

typedef ::data_manager::bag_updateResponse_<std::allocator<void> > bag_updateResponse;

typedef boost::shared_ptr< ::data_manager::bag_updateResponse > bag_updateResponsePtr;
typedef boost::shared_ptr< ::data_manager::bag_updateResponse const> bag_updateResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::data_manager::bag_updateResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::data_manager::bag_updateResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace data_manager

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'data_manager': ['/media/woodlab/DATAPART1/watertank-gantry/ROS/catkin_ws/src/data_manager/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::data_manager::bag_updateResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::data_manager::bag_updateResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::data_manager::bag_updateResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::data_manager::bag_updateResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::data_manager::bag_updateResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::data_manager::bag_updateResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::data_manager::bag_updateResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d41d8cd98f00b204e9800998ecf8427e";
  }

  static const char* value(const ::data_manager::bag_updateResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd41d8cd98f00b204ULL;
  static const uint64_t static_value2 = 0xe9800998ecf8427eULL;
};

template<class ContainerAllocator>
struct DataType< ::data_manager::bag_updateResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "data_manager/bag_updateResponse";
  }

  static const char* value(const ::data_manager::bag_updateResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::data_manager::bag_updateResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n\
";
  }

  static const char* value(const ::data_manager::bag_updateResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::data_manager::bag_updateResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream&, T)
    {}

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct bag_updateResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::data_manager::bag_updateResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream&, const std::string&, const ::data_manager::bag_updateResponse_<ContainerAllocator>&)
  {}
};

} // namespace message_operations
} // namespace ros

#endif // DATA_MANAGER_MESSAGE_BAG_UPDATERESPONSE_H

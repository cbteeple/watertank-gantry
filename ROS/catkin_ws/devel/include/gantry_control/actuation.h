// Generated by gencpp from file gantry_control/actuation.msg
// DO NOT EDIT!


#ifndef GANTRY_CONTROL_MESSAGE_ACTUATION_H
#define GANTRY_CONTROL_MESSAGE_ACTUATION_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace gantry_control
{
template <class ContainerAllocator>
struct actuation_
{
  typedef actuation_<ContainerAllocator> Type;

  actuation_()
    : levels()  {
    }
  actuation_(const ContainerAllocator& _alloc)
    : levels(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector<float, typename ContainerAllocator::template rebind<float>::other >  _levels_type;
  _levels_type levels;





  typedef boost::shared_ptr< ::gantry_control::actuation_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::gantry_control::actuation_<ContainerAllocator> const> ConstPtr;

}; // struct actuation_

typedef ::gantry_control::actuation_<std::allocator<void> > actuation;

typedef boost::shared_ptr< ::gantry_control::actuation > actuationPtr;
typedef boost::shared_ptr< ::gantry_control::actuation const> actuationConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::gantry_control::actuation_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::gantry_control::actuation_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace gantry_control

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'gantry_control': ['/media/woodlab/DATAPART1/watertank-gantry/ROS/catkin_ws/src/gantry_control/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::gantry_control::actuation_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::gantry_control::actuation_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::gantry_control::actuation_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::gantry_control::actuation_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::gantry_control::actuation_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::gantry_control::actuation_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::gantry_control::actuation_<ContainerAllocator> >
{
  static const char* value()
  {
    return "36506dab5a92e5be22a70802ef8ef9e7";
  }

  static const char* value(const ::gantry_control::actuation_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x36506dab5a92e5beULL;
  static const uint64_t static_value2 = 0x22a70802ef8ef9e7ULL;
};

template<class ContainerAllocator>
struct DataType< ::gantry_control::actuation_<ContainerAllocator> >
{
  static const char* value()
  {
    return "gantry_control/actuation";
  }

  static const char* value(const ::gantry_control::actuation_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::gantry_control::actuation_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32[] levels\n\
";
  }

  static const char* value(const ::gantry_control::actuation_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::gantry_control::actuation_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.levels);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct actuation_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::gantry_control::actuation_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::gantry_control::actuation_<ContainerAllocator>& v)
  {
    s << indent << "levels[]" << std::endl;
    for (size_t i = 0; i < v.levels.size(); ++i)
    {
      s << indent << "  levels[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.levels[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // GANTRY_CONTROL_MESSAGE_ACTUATION_H
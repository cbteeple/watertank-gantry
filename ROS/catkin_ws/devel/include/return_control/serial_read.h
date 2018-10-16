// Generated by gencpp from file return_control/serial_read.msg
// DO NOT EDIT!


#ifndef RETURN_CONTROL_MESSAGE_SERIAL_READ_H
#define RETURN_CONTROL_MESSAGE_SERIAL_READ_H

#include <ros/service_traits.h>


#include <return_control/serial_readRequest.h>
#include <return_control/serial_readResponse.h>


namespace return_control
{

struct serial_read
{

typedef serial_readRequest Request;
typedef serial_readResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct serial_read
} // namespace return_control


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::return_control::serial_read > {
  static const char* value()
  {
    return "b191cc1f130fc908db72dc38712947ff";
  }

  static const char* value(const ::return_control::serial_read&) { return value(); }
};

template<>
struct DataType< ::return_control::serial_read > {
  static const char* value()
  {
    return "return_control/serial_read";
  }

  static const char* value(const ::return_control::serial_read&) { return value(); }
};


// service_traits::MD5Sum< ::return_control::serial_readRequest> should match 
// service_traits::MD5Sum< ::return_control::serial_read > 
template<>
struct MD5Sum< ::return_control::serial_readRequest>
{
  static const char* value()
  {
    return MD5Sum< ::return_control::serial_read >::value();
  }
  static const char* value(const ::return_control::serial_readRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::return_control::serial_readRequest> should match 
// service_traits::DataType< ::return_control::serial_read > 
template<>
struct DataType< ::return_control::serial_readRequest>
{
  static const char* value()
  {
    return DataType< ::return_control::serial_read >::value();
  }
  static const char* value(const ::return_control::serial_readRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::return_control::serial_readResponse> should match 
// service_traits::MD5Sum< ::return_control::serial_read > 
template<>
struct MD5Sum< ::return_control::serial_readResponse>
{
  static const char* value()
  {
    return MD5Sum< ::return_control::serial_read >::value();
  }
  static const char* value(const ::return_control::serial_readResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::return_control::serial_readResponse> should match 
// service_traits::DataType< ::return_control::serial_read > 
template<>
struct DataType< ::return_control::serial_readResponse>
{
  static const char* value()
  {
    return DataType< ::return_control::serial_read >::value();
  }
  static const char* value(const ::return_control::serial_readResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // RETURN_CONTROL_MESSAGE_SERIAL_READ_H
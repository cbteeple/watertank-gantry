// Generated by gencpp from file return_control/SerialSend.msg
// DO NOT EDIT!


#ifndef RETURN_CONTROL_MESSAGE_SERIALSEND_H
#define RETURN_CONTROL_MESSAGE_SERIALSEND_H

#include <ros/service_traits.h>


#include <return_control/SerialSendRequest.h>
#include <return_control/SerialSendResponse.h>


namespace return_control
{

struct SerialSend
{

typedef SerialSendRequest Request;
typedef SerialSendResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct SerialSend
} // namespace return_control


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::return_control::SerialSend > {
  static const char* value()
  {
    return "4a85f0858e5941ef92944e5dd453320b";
  }

  static const char* value(const ::return_control::SerialSend&) { return value(); }
};

template<>
struct DataType< ::return_control::SerialSend > {
  static const char* value()
  {
    return "return_control/SerialSend";
  }

  static const char* value(const ::return_control::SerialSend&) { return value(); }
};


// service_traits::MD5Sum< ::return_control::SerialSendRequest> should match 
// service_traits::MD5Sum< ::return_control::SerialSend > 
template<>
struct MD5Sum< ::return_control::SerialSendRequest>
{
  static const char* value()
  {
    return MD5Sum< ::return_control::SerialSend >::value();
  }
  static const char* value(const ::return_control::SerialSendRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::return_control::SerialSendRequest> should match 
// service_traits::DataType< ::return_control::SerialSend > 
template<>
struct DataType< ::return_control::SerialSendRequest>
{
  static const char* value()
  {
    return DataType< ::return_control::SerialSend >::value();
  }
  static const char* value(const ::return_control::SerialSendRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::return_control::SerialSendResponse> should match 
// service_traits::MD5Sum< ::return_control::SerialSend > 
template<>
struct MD5Sum< ::return_control::SerialSendResponse>
{
  static const char* value()
  {
    return MD5Sum< ::return_control::SerialSend >::value();
  }
  static const char* value(const ::return_control::SerialSendResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::return_control::SerialSendResponse> should match 
// service_traits::DataType< ::return_control::SerialSend > 
template<>
struct DataType< ::return_control::SerialSendResponse>
{
  static const char* value()
  {
    return DataType< ::return_control::SerialSend >::value();
  }
  static const char* value(const ::return_control::SerialSendResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // RETURN_CONTROL_MESSAGE_SERIALSEND_H
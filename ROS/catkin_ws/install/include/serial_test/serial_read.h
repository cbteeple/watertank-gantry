// Generated by gencpp from file serial_test/serial_read.msg
// DO NOT EDIT!


#ifndef SERIAL_TEST_MESSAGE_SERIAL_READ_H
#define SERIAL_TEST_MESSAGE_SERIAL_READ_H

#include <ros/service_traits.h>


#include <serial_test/serial_readRequest.h>
#include <serial_test/serial_readResponse.h>


namespace serial_test
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
} // namespace serial_test


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::serial_test::serial_read > {
  static const char* value()
  {
    return "b191cc1f130fc908db72dc38712947ff";
  }

  static const char* value(const ::serial_test::serial_read&) { return value(); }
};

template<>
struct DataType< ::serial_test::serial_read > {
  static const char* value()
  {
    return "serial_test/serial_read";
  }

  static const char* value(const ::serial_test::serial_read&) { return value(); }
};


// service_traits::MD5Sum< ::serial_test::serial_readRequest> should match 
// service_traits::MD5Sum< ::serial_test::serial_read > 
template<>
struct MD5Sum< ::serial_test::serial_readRequest>
{
  static const char* value()
  {
    return MD5Sum< ::serial_test::serial_read >::value();
  }
  static const char* value(const ::serial_test::serial_readRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::serial_test::serial_readRequest> should match 
// service_traits::DataType< ::serial_test::serial_read > 
template<>
struct DataType< ::serial_test::serial_readRequest>
{
  static const char* value()
  {
    return DataType< ::serial_test::serial_read >::value();
  }
  static const char* value(const ::serial_test::serial_readRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::serial_test::serial_readResponse> should match 
// service_traits::MD5Sum< ::serial_test::serial_read > 
template<>
struct MD5Sum< ::serial_test::serial_readResponse>
{
  static const char* value()
  {
    return MD5Sum< ::serial_test::serial_read >::value();
  }
  static const char* value(const ::serial_test::serial_readResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::serial_test::serial_readResponse> should match 
// service_traits::DataType< ::serial_test::serial_read > 
template<>
struct DataType< ::serial_test::serial_readResponse>
{
  static const char* value()
  {
    return DataType< ::serial_test::serial_read >::value();
  }
  static const char* value(const ::serial_test::serial_readResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // SERIAL_TEST_MESSAGE_SERIAL_READ_H

// Generated by gencpp from file data_manager/bag_update.msg
// DO NOT EDIT!


#ifndef DATA_MANAGER_MESSAGE_BAG_UPDATE_H
#define DATA_MANAGER_MESSAGE_BAG_UPDATE_H

#include <ros/service_traits.h>


#include <data_manager/bag_updateRequest.h>
#include <data_manager/bag_updateResponse.h>


namespace data_manager
{

struct bag_update
{

typedef bag_updateRequest Request;
typedef bag_updateResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct bag_update
} // namespace data_manager


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::data_manager::bag_update > {
  static const char* value()
  {
    return "030824f52a0628ead956fb9d67e66ae9";
  }

  static const char* value(const ::data_manager::bag_update&) { return value(); }
};

template<>
struct DataType< ::data_manager::bag_update > {
  static const char* value()
  {
    return "data_manager/bag_update";
  }

  static const char* value(const ::data_manager::bag_update&) { return value(); }
};


// service_traits::MD5Sum< ::data_manager::bag_updateRequest> should match 
// service_traits::MD5Sum< ::data_manager::bag_update > 
template<>
struct MD5Sum< ::data_manager::bag_updateRequest>
{
  static const char* value()
  {
    return MD5Sum< ::data_manager::bag_update >::value();
  }
  static const char* value(const ::data_manager::bag_updateRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::data_manager::bag_updateRequest> should match 
// service_traits::DataType< ::data_manager::bag_update > 
template<>
struct DataType< ::data_manager::bag_updateRequest>
{
  static const char* value()
  {
    return DataType< ::data_manager::bag_update >::value();
  }
  static const char* value(const ::data_manager::bag_updateRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::data_manager::bag_updateResponse> should match 
// service_traits::MD5Sum< ::data_manager::bag_update > 
template<>
struct MD5Sum< ::data_manager::bag_updateResponse>
{
  static const char* value()
  {
    return MD5Sum< ::data_manager::bag_update >::value();
  }
  static const char* value(const ::data_manager::bag_updateResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::data_manager::bag_updateResponse> should match 
// service_traits::DataType< ::data_manager::bag_update > 
template<>
struct DataType< ::data_manager::bag_updateResponse>
{
  static const char* value()
  {
    return DataType< ::data_manager::bag_update >::value();
  }
  static const char* value(const ::data_manager::bag_updateResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // DATA_MANAGER_MESSAGE_BAG_UPDATE_H

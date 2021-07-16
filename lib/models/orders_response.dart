import 'package:mealup_restaurant_side/retrofit/api_client.dart';
import 'package:mealup_restaurant_side/retrofit/api_header.dart';
import 'package:mealup_restaurant_side/retrofit/base_model.dart';
import 'package:mealup_restaurant_side/retrofit/server_error.dart';

/// success : true
/// data : [{"id":180,"order_id":"#383884","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-05-10","time":"09:37 am","payment_type":"COD","payment_token":null,"payment_status":"0","amount":502,"admin_commission":75,"vendor_amount":427,"delivery_type":"HOME","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":13,"delivery_charge":150,"order_status":"CANCEL","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":21.0,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"},{\"tax\":21.0,\"name\":\"other tax\"}]","order_start_time":null,"order_end_time":null,"created_at":"2021-05-10T04:07:07.000000Z","updated_at":"2021-05-10T09:53:41.000000Z","orderItems":[{"id":308,"order_id":180,"item":50,"price":105,"qty":1,"custimization":null,"created_at":"2021-05-10T04:07:07.000000Z","updated_at":"2021-05-10T04:07:07.000000Z","itemName":"manchurian"},{"id":309,"order_id":180,"item":51,"price":105,"qty":1,"custimization":null,"created_at":"2021-05-10T04:07:07.000000Z","updated_at":"2021-05-10T04:07:07.000000Z","itemName":"chinese bhel"}]},{"id":190,"order_id":"#104345","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-05-19","time":"09:32 am","payment_type":"COD","payment_token":null,"payment_status":"0","amount":376,"admin_commission":56,"vendor_amount":320,"delivery_type":"HOME","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":11,"delivery_charge":150,"order_status":"CANCEL","cancel_by":"user","cancel_reason":"hhh","tax":"[{\"tax\":10.5,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"},{\"tax\":10.5,\"name\":\"other tax\"}]","order_start_time":null,"order_end_time":null,"created_at":"2021-05-19T02:32:05.000000Z","updated_at":"2021-05-19T02:33:36.000000Z","orderItems":[{"id":329,"order_id":190,"item":50,"price":105,"qty":1,"custimization":null,"created_at":"2021-05-19T02:32:05.000000Z","updated_at":"2021-05-19T02:32:05.000000Z","itemName":"manchurian"}]},{"id":192,"order_id":"#868187","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-05-19","time":"11:05 am","payment_type":"COD","payment_token":null,"payment_status":"0","amount":508,"admin_commission":76,"vendor_amount":432,"delivery_type":"HOME","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":11,"delivery_charge":150,"order_status":"CANCEL","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":10.5,\"name\":\"other tax\"},{\"tax\":10.5,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"}]","order_start_time":null,"order_end_time":null,"created_at":"2021-05-19T04:05:37.000000Z","updated_at":"2021-05-19T05:13:46.000000Z","orderItems":[{"id":331,"order_id":192,"item":50,"price":105,"qty":1,"custimization":null,"created_at":"2021-05-19T04:05:37.000000Z","updated_at":"2021-05-19T04:05:37.000000Z","itemName":"manchurian"}]},{"id":194,"order_id":"#280212","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-05-19","time":"12:20 pm","payment_type":"COD","payment_token":null,"payment_status":"0","amount":502,"admin_commission":75,"vendor_amount":427,"delivery_type":"HOME","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":13,"delivery_charge":150,"order_status":"COMPLETE","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":21.0,\"name\":\"other tax\"},{\"tax\":21.0,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"}]","order_start_time":"10:50 am","order_end_time":"10:52 am","created_at":"2021-05-19T05:20:29.000000Z","updated_at":"2021-05-19T05:22:37.000000Z","orderItems":[{"id":334,"order_id":194,"item":50,"price":210,"qty":2,"custimization":null,"created_at":"2021-05-19T05:20:29.000000Z","updated_at":"2021-05-19T05:20:29.000000Z","itemName":"manchurian"}]},{"id":195,"order_id":"#280401","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-05-19","time":"12:30 pm","payment_type":"COD","payment_token":null,"payment_status":"0","amount":376,"admin_commission":56,"vendor_amount":320,"delivery_type":"HOME","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":11,"delivery_charge":150,"order_status":"DELIVERED","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":10.5,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"},{\"tax\":10.5,\"name\":\"other tax\"}]","order_start_time":"11:01 am","order_end_time":null,"created_at":"2021-05-19T05:30:38.000000Z","updated_at":"2021-06-05T06:05:17.000000Z","orderItems":[{"id":335,"order_id":195,"item":51,"price":105,"qty":1,"custimization":null,"created_at":"2021-05-19T05:30:38.000000Z","updated_at":"2021-05-19T05:30:38.000000Z","itemName":"chinese bhel"}]},{"id":208,"order_id":"#254150","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-05-19","time":"04:02 pm","payment_type":"COD","payment_token":null,"payment_status":"0","amount":376,"admin_commission":56,"vendor_amount":320,"delivery_type":"HOME","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":13,"delivery_charge":150,"order_status":"CANCEL","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":10.5,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"},{\"tax\":10.5,\"name\":\"other tax\"}]","order_start_time":null,"order_end_time":null,"created_at":"2021-05-19T10:32:57.000000Z","updated_at":"2021-05-19T13:40:22.000000Z","orderItems":[{"id":350,"order_id":208,"item":51,"price":105,"qty":1,"custimization":null,"created_at":"2021-05-19T10:32:57.000000Z","updated_at":"2021-05-19T10:32:57.000000Z","itemName":"chinese bhel"}]},{"id":209,"order_id":"#339400","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-05-19","time":"04:04 pm","payment_type":"COD","payment_token":null,"payment_status":"0","amount":502,"admin_commission":75,"vendor_amount":427,"delivery_type":"HOME","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":13,"delivery_charge":150,"order_status":"CANCEL","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":21.0,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"},{\"tax\":21.0,\"name\":\"other tax\"}]","order_start_time":null,"order_end_time":null,"created_at":"2021-05-19T10:34:55.000000Z","updated_at":"2021-05-19T13:40:22.000000Z","orderItems":[{"id":351,"order_id":209,"item":50,"price":105,"qty":1,"custimization":null,"created_at":"2021-05-19T10:34:55.000000Z","updated_at":"2021-05-19T10:34:55.000000Z","itemName":"manchurian"},{"id":352,"order_id":209,"item":51,"price":105,"qty":1,"custimization":null,"created_at":"2021-05-19T10:34:55.000000Z","updated_at":"2021-05-19T10:34:55.000000Z","itemName":"chinese bhel"}]},{"id":212,"order_id":"#847049","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-05-19","time":"10:55 am","payment_type":"COD","payment_token":null,"payment_status":"0","amount":786,"admin_commission":117,"vendor_amount":669,"delivery_type":"HOME","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":11,"delivery_charge":150,"order_status":"CANCEL","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":21.0,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"},{\"tax\":21.0,\"name\":\"other tax\"}]","order_start_time":null,"order_end_time":null,"created_at":"2021-05-19T13:56:06.000000Z","updated_at":"2021-05-19T15:48:47.000000Z","orderItems":[{"id":355,"order_id":212,"item":50,"price":105,"qty":1,"custimization":null,"created_at":"2021-05-19T13:56:06.000000Z","updated_at":"2021-05-19T13:56:06.000000Z","itemName":"manchurian"},{"id":356,"order_id":212,"item":51,"price":105,"qty":1,"custimization":null,"created_at":"2021-05-19T13:56:06.000000Z","updated_at":"2021-05-19T13:56:06.000000Z","itemName":"chinese bhel"}]},{"id":216,"order_id":"#794311","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-05-20","time":"08:08 am","payment_type":"COD","payment_token":null,"payment_status":"0","amount":618,"admin_commission":92,"vendor_amount":526,"delivery_type":"HOME","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":13,"delivery_charge":150,"order_status":"CANCEL","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":10.5,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"},{\"tax\":10.5,\"name\":\"other tax\"}]","order_start_time":null,"order_end_time":null,"created_at":"2021-05-20T02:38:42.000000Z","updated_at":"2021-05-20T03:40:12.000000Z","orderItems":[{"id":362,"order_id":216,"item":51,"price":105,"qty":1,"custimization":null,"created_at":"2021-05-20T02:38:42.000000Z","updated_at":"2021-05-20T02:38:42.000000Z","itemName":"chinese bhel"}]},{"id":218,"order_id":"#177890","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-05-20","time":"09:27 am","payment_type":"COD","payment_token":null,"payment_status":"0","amount":376,"admin_commission":56,"vendor_amount":320,"delivery_type":"HOME","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":13,"delivery_charge":150,"order_status":"CANCEL","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":10.5,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"},{\"tax\":10.5,\"name\":\"other tax\"}]","order_start_time":null,"order_end_time":null,"created_at":"2021-05-20T03:57:58.000000Z","updated_at":"2021-05-20T05:00:33.000000Z","orderItems":[{"id":364,"order_id":218,"item":51,"price":105,"qty":1,"custimization":null,"created_at":"2021-05-20T03:57:58.000000Z","updated_at":"2021-05-20T03:57:58.000000Z","itemName":"chinese bhel"}]},{"id":220,"order_id":"#391299","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-05-20","time":"12:43 am","payment_type":"COD","payment_token":null,"payment_status":"0","amount":1070,"admin_commission":160,"vendor_amount":910,"delivery_type":"HOME","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":11,"delivery_charge":150,"order_status":"CANCEL","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":21.0,\"name\":\"other tax\"},{\"tax\":21.0,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"}]","order_start_time":"11:34 am","order_end_time":null,"created_at":"2021-05-20T05:44:06.000000Z","updated_at":"2021-05-21T01:14:12.000000Z","orderItems":[{"id":367,"order_id":220,"item":50,"price":105,"qty":1,"custimization":null,"created_at":"2021-05-20T05:44:06.000000Z","updated_at":"2021-05-20T05:44:06.000000Z","itemName":"manchurian"},{"id":368,"order_id":220,"item":51,"price":105,"qty":1,"custimization":null,"created_at":"2021-05-20T05:44:06.000000Z","updated_at":"2021-05-20T05:44:06.000000Z","itemName":"chinese bhel"}]},{"id":246,"order_id":"#135635","vendor_id":49,"user_id":136,"delivery_person_id":null,"date":"2021-05-25","time":"12:33 am","payment_type":"COD","payment_token":null,"payment_status":"1","amount":476,"admin_commission":71,"vendor_amount":405,"delivery_type":"SHOP","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":0,"address_id":null,"delivery_charge":null,"order_status":"COMPLETE","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":31,\"name\":\"basic tax\"},{\"tax\":100,\"name\":\"gst\"},{\"tax\":31,\"name\":\"other tax\"}]","order_start_time":"12:34 am","order_end_time":"12:34 am","created_at":"2021-05-24T19:03:43.000000Z","updated_at":"2021-05-24T19:04:13.000000Z","orderItems":[{"id":417,"order_id":246,"item":45,"price":157,"qty":1,"custimization":null,"created_at":"2021-05-24T19:03:43.000000Z","updated_at":"2021-05-24T19:03:43.000000Z","itemName":"dhosa"},{"id":418,"order_id":246,"item":46,"price":52,"qty":1,"custimization":null,"created_at":"2021-05-24T19:03:43.000000Z","updated_at":"2021-05-24T19:03:43.000000Z","itemName":"idali"},{"id":419,"order_id":246,"item":51,"price":105,"qty":1,"custimization":null,"created_at":"2021-05-24T19:03:43.000000Z","updated_at":"2021-05-24T19:03:43.000000Z","itemName":"chinese bhel"}]},{"id":248,"order_id":"#300516","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-05-25","time":"02:18 am","payment_type":"COD","payment_token":null,"payment_status":"1","amount":349,"admin_commission":52,"vendor_amount":297,"delivery_type":"SHOP","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":0,"address_id":null,"delivery_charge":null,"order_status":"COMPLETE","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":20,\"name\":\"basic tax\"},{\"tax\":100,\"name\":\"gst\"},{\"tax\":20,\"name\":\"other tax\"}]","order_start_time":"02:21 am","order_end_time":"02:21 am","created_at":"2021-05-24T20:48:57.000000Z","updated_at":"2021-05-24T20:51:16.000000Z","orderItems":[{"id":421,"order_id":248,"item":45,"price":157,"qty":1,"custimization":null,"created_at":"2021-05-24T20:48:57.000000Z","updated_at":"2021-05-24T20:48:57.000000Z","itemName":"dhosa"},{"id":422,"order_id":248,"item":46,"price":52,"qty":1,"custimization":null,"created_at":"2021-05-24T20:48:57.000000Z","updated_at":"2021-05-24T20:48:57.000000Z","itemName":"idali"}]},{"id":250,"order_id":"#480177","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-05-24","time":"06:00 pm","payment_type":"COD","payment_token":null,"payment_status":"0","amount":539,"admin_commission":80,"vendor_amount":459,"delivery_type":"SHOP","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":null,"delivery_charge":150,"order_status":"APPROVE","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":15.75,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"},{\"tax\":15.75,\"name\":\"other tax\"}]","order_start_time":"02:34 am","order_end_time":null,"created_at":"2021-05-24T21:02:26.000000Z","updated_at":"2021-05-24T21:04:44.000000Z","orderItems":[{"id":425,"order_id":250,"item":45,"price":158,"qty":1,"custimization":[],"created_at":"2021-05-24T21:02:26.000000Z","updated_at":"2021-05-24T21:02:26.000000Z","itemName":"dhosa"}]},{"id":251,"order_id":"#354583","vendor_id":49,"user_id":139,"delivery_person_id":11,"date":"2021-05-24","time":"06:05 pm","payment_type":"COD","payment_token":null,"payment_status":"0","amount":739,"admin_commission":110,"vendor_amount":629,"delivery_type":"HOME","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":11,"delivery_charge":150,"order_status":"COMPLETE","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":10.5,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"},{\"tax\":10.5,\"name\":\"other tax\"}]","order_start_time":"02:37 am","order_end_time":null,"created_at":"2021-05-24T21:07:00.000000Z","updated_at":"2021-05-24T21:10:34.000000Z","orderItems":[{"id":426,"order_id":251,"item":51,"price":105,"qty":1,"custimization":null,"created_at":"2021-05-24T21:07:00.000000Z","updated_at":"2021-05-24T21:07:00.000000Z","itemName":"chinese bhel"}]},{"id":252,"order_id":"#222529","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-05-24","time":"02:12 pm","payment_type":"COD","payment_token":null,"payment_status":"0","amount":481,"admin_commission":72,"vendor_amount":409,"delivery_type":"SHOP","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":null,"delivery_charge":150,"order_status":"CANCEL","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":21.0,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"},{\"tax\":21.0,\"name\":\"other tax\"}]","order_start_time":null,"order_end_time":null,"created_at":"2021-05-24T21:12:55.000000Z","updated_at":"2021-05-25T00:51:40.000000Z","orderItems":[{"id":427,"order_id":252,"item":50,"price":105,"qty":1,"custimization":null,"created_at":"2021-05-24T21:12:55.000000Z","updated_at":"2021-05-24T21:12:55.000000Z","itemName":"manchurian"},{"id":428,"order_id":252,"item":51,"price":105,"qty":1,"custimization":null,"created_at":"2021-05-24T21:12:55.000000Z","updated_at":"2021-05-24T21:12:55.000000Z","itemName":"chinese bhel"}]},{"id":253,"order_id":"#871254","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-05-25","time":"07:05 am","payment_type":"COD","payment_token":null,"payment_status":"0","amount":376,"admin_commission":56,"vendor_amount":320,"delivery_type":"HOME","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":11,"delivery_charge":150,"order_status":"CANCEL","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":10.5,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"},{\"tax\":10.5,\"name\":\"other tax\"}]","order_start_time":null,"order_end_time":null,"created_at":"2021-05-25T01:35:21.000000Z","updated_at":"2021-05-25T02:38:50.000000Z","orderItems":[{"id":429,"order_id":253,"item":50,"price":105,"qty":1,"custimization":null,"created_at":"2021-05-25T01:35:21.000000Z","updated_at":"2021-05-25T01:35:21.000000Z","itemName":"manchurian"}]},{"id":255,"order_id":"#467478","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-05-25","time":"02:50 am","payment_type":"COD","payment_token":null,"payment_status":"0","amount":376,"admin_commission":56,"vendor_amount":320,"delivery_type":"HOME","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":13,"delivery_charge":150,"order_status":"CANCEL","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":10.5,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"},{\"tax\":10.5,\"name\":\"other tax\"}]","order_start_time":null,"order_end_time":null,"created_at":"2021-05-25T01:50:49.000000Z","updated_at":"2021-05-25T03:00:27.000000Z","orderItems":[{"id":431,"order_id":255,"item":50,"price":105,"qty":1,"custimization":null,"created_at":"2021-05-25T01:50:49.000000Z","updated_at":"2021-05-25T01:50:49.000000Z","itemName":"manchurian"}]},{"id":259,"order_id":"#998273","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-05-25","time":"02:25 pm","payment_type":"COD","payment_token":null,"payment_status":"1","amount":853,"admin_commission":127,"vendor_amount":726,"delivery_type":"SHOP","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":0,"address_id":null,"delivery_charge":null,"order_status":"APPROVE","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":62,\"name\":\"basic tax\"},{\"tax\":100,\"name\":\"gst\"},{\"tax\":62,\"name\":\"other tax\"}]","order_start_time":null,"order_end_time":null,"created_at":"2021-05-25T08:55:25.000000Z","updated_at":"2021-05-25T08:55:25.000000Z","orderItems":[{"id":436,"order_id":259,"item":45,"price":315,"qty":2,"custimization":null,"created_at":"2021-05-25T08:55:25.000000Z","updated_at":"2021-05-25T08:55:25.000000Z","itemName":"dhosa"},{"id":437,"order_id":259,"item":50,"price":105,"qty":1,"custimization":null,"created_at":"2021-05-25T08:55:25.000000Z","updated_at":"2021-05-25T08:55:25.000000Z","itemName":"manchurian"},{"id":438,"order_id":259,"item":51,"price":210,"qty":2,"custimization":null,"created_at":"2021-05-25T08:55:25.000000Z","updated_at":"2021-05-25T08:55:25.000000Z","itemName":"chinese bhel"}]},{"id":264,"order_id":"#845572","vendor_id":49,"user_id":139,"delivery_person_id":11,"date":"2021-05-25","time":"02:47 pm","payment_type":"COD","payment_token":null,"payment_status":"0","amount":376,"admin_commission":56,"vendor_amount":320,"delivery_type":"HOME","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":13,"delivery_charge":150,"order_status":"COMPLETE","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":10.5,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"},{\"tax\":10.5,\"name\":\"other tax\"}]","order_start_time":"02:48 pm","order_end_time":null,"created_at":"2021-05-25T09:17:57.000000Z","updated_at":"2021-05-25T09:19:17.000000Z","orderItems":[{"id":444,"order_id":264,"item":50,"price":105,"qty":1,"custimization":null,"created_at":"2021-05-25T09:17:57.000000Z","updated_at":"2021-05-25T09:17:57.000000Z","itemName":"manchurian"}]},{"id":265,"order_id":"#445856","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-05-25","time":"04:07 pm","payment_type":"COD","payment_token":null,"payment_status":"0","amount":860,"admin_commission":129,"vendor_amount":731,"delivery_type":"HOME","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":11,"delivery_charge":150,"order_status":"CANCEL","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":10.5,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"},{\"tax\":10.5,\"name\":\"other tax\"}]","order_start_time":null,"order_end_time":null,"created_at":"2021-05-25T10:37:45.000000Z","updated_at":"2021-05-25T12:59:51.000000Z","orderItems":[{"id":445,"order_id":265,"item":50,"price":105,"qty":1,"custimization":null,"created_at":"2021-05-25T10:37:45.000000Z","updated_at":"2021-05-25T10:37:45.000000Z","itemName":"manchurian"}]},{"id":276,"order_id":"#684836","vendor_id":49,"user_id":172,"delivery_person_id":null,"date":"2021-05-25","time":"08:50 pm","payment_type":"COD","payment_token":null,"payment_status":"0","amount":478,"admin_commission":71,"vendor_amount":407,"delivery_type":"SHOP","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":null,"delivery_charge":null,"order_status":"APPROVE","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":31.5,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"},{\"tax\":31.5,\"name\":\"other tax\"}]","order_start_time":"08:50 pm","order_end_time":null,"created_at":"2021-05-25T15:20:14.000000Z","updated_at":"2021-05-25T15:20:34.000000Z","orderItems":[{"id":462,"order_id":276,"item":50,"price":105,"qty":1,"custimization":null,"created_at":"2021-05-25T15:20:14.000000Z","updated_at":"2021-05-25T15:20:14.000000Z","itemName":"manchurian"},{"id":463,"order_id":276,"item":51,"price":210,"qty":2,"custimization":null,"created_at":"2021-05-25T15:20:14.000000Z","updated_at":"2021-05-25T15:20:14.000000Z","itemName":"chinese bhel"}]},{"id":280,"order_id":"#347759","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-05-26","time":"04:26 pm","payment_type":"COD","payment_token":null,"payment_status":"0","amount":502,"admin_commission":75,"vendor_amount":427,"delivery_type":"HOME","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":17,"delivery_charge":150,"order_status":"CANCEL","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":21.0,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"},{\"tax\":21.0,\"name\":\"other tax\"}]","order_start_time":null,"order_end_time":null,"created_at":"2021-05-26T10:57:00.000000Z","updated_at":"2021-05-26T12:11:00.000000Z","orderItems":[{"id":467,"order_id":280,"item":50,"price":105,"qty":1,"custimization":null,"created_at":"2021-05-26T10:57:00.000000Z","updated_at":"2021-05-26T10:57:00.000000Z","itemName":"manchurian"},{"id":468,"order_id":280,"item":51,"price":105,"qty":1,"custimization":null,"created_at":"2021-05-26T10:57:00.000000Z","updated_at":"2021-05-26T10:57:00.000000Z","itemName":"chinese bhel"}]},{"id":284,"order_id":"#605483","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-05-26","time":"06:54 pm","payment_type":"COD","payment_token":null,"payment_status":"0","amount":723,"admin_commission":108,"vendor_amount":615,"delivery_type":"HOME","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":17,"delivery_charge":150,"order_status":"CANCEL","cancel_by":"user","cancel_reason":"por pandemia","tax":"[{\"tax\":21.0,\"name\":\"other tax\"},{\"tax\":21.0,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"}]","order_start_time":"04:26 am","order_end_time":null,"created_at":"2021-05-26T22:55:12.000000Z","updated_at":"2021-05-26T23:00:00.000000Z","orderItems":[{"id":474,"order_id":284,"item":50,"price":105,"qty":1,"custimization":null,"created_at":"2021-05-26T22:55:12.000000Z","updated_at":"2021-05-26T22:55:12.000000Z","itemName":"manchurian"},{"id":475,"order_id":284,"item":51,"price":105,"qty":1,"custimization":null,"created_at":"2021-05-26T22:55:12.000000Z","updated_at":"2021-05-26T22:55:12.000000Z","itemName":"chinese bhel"}]},{"id":287,"order_id":"#290452","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-05-27","time":"04:45 am","payment_type":"COD","payment_token":null,"payment_status":"0","amount":376,"admin_commission":56,"vendor_amount":320,"delivery_type":"HOME","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":11,"delivery_charge":150,"order_status":"COMPLETE","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":10.5,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"},{\"tax\":10.5,\"name\":\"other tax\"}]","order_start_time":"04:46 am","order_end_time":"04:49 am","created_at":"2021-05-26T23:15:58.000000Z","updated_at":"2021-05-26T23:19:06.000000Z","orderItems":[{"id":479,"order_id":287,"item":51,"price":105,"qty":1,"custimization":null,"created_at":"2021-05-26T23:15:58.000000Z","updated_at":"2021-05-26T23:15:58.000000Z","itemName":"chinese bhel"}]},{"id":290,"order_id":"#562726","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-05-27","time":"07:12 am","payment_type":"COD","payment_token":null,"payment_status":"0","amount":938,"admin_commission":140,"vendor_amount":798,"delivery_type":"HOME","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":17,"delivery_charge":150,"order_status":"CANCEL","cancel_by":"user","cancel_reason":"tessssst","tax":"[{\"tax\":42.0,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"},{\"tax\":42.0,\"name\":\"other tax\"}]","order_start_time":"05:45 am","order_end_time":null,"created_at":"2021-05-27T00:13:10.000000Z","updated_at":"2021-05-27T00:17:26.000000Z","orderItems":[{"id":486,"order_id":290,"item":50,"price":315,"qty":3,"custimization":null,"created_at":"2021-05-27T00:13:10.000000Z","updated_at":"2021-05-27T00:13:10.000000Z","itemName":"manchurian"},{"id":487,"order_id":290,"item":51,"price":105,"qty":1,"custimization":null,"created_at":"2021-05-27T00:13:10.000000Z","updated_at":"2021-05-27T00:13:10.000000Z","itemName":"chinese bhel"}]},{"id":295,"order_id":"#110558","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-05-27","time":"09:10 am","payment_type":"COD","payment_token":null,"payment_status":"0","amount":19522,"admin_commission":2928,"vendor_amount":16594,"delivery_type":"HOME","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":19,"delivery_charge":150,"order_status":"APPROVE","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":42.0,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"},{\"tax\":42.0,\"name\":\"other tax\"}]","order_start_time":"10:10 pm","order_end_time":null,"created_at":"2021-05-27T02:15:09.000000Z","updated_at":"2021-06-04T16:40:35.000000Z","orderItems":[{"id":495,"order_id":295,"item":50,"price":210,"qty":2,"custimization":null,"created_at":"2021-05-27T02:15:09.000000Z","updated_at":"2021-05-27T02:15:09.000000Z","itemName":"manchurian"},{"id":496,"order_id":295,"item":51,"price":210,"qty":2,"custimization":null,"created_at":"2021-05-27T02:15:09.000000Z","updated_at":"2021-05-27T02:15:09.000000Z","itemName":"chinese bhel"}]},{"id":306,"order_id":"#566562","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-05-28","time":"12:52 am","payment_type":"COD","payment_token":null,"payment_status":"0","amount":854,"admin_commission":128,"vendor_amount":726,"delivery_type":"HOME","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":17,"delivery_charge":150,"order_status":"CANCEL","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":42.0,\"name\":\"other tax\"},{\"tax\":42.0,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"}]","order_start_time":null,"order_end_time":null,"created_at":"2021-05-27T17:52:56.000000Z","updated_at":"2021-05-27T20:11:28.000000Z","orderItems":[{"id":519,"order_id":306,"item":50,"price":210,"qty":2,"custimization":null,"created_at":"2021-05-27T17:52:56.000000Z","updated_at":"2021-05-27T17:52:56.000000Z","itemName":"manchurian"},{"id":520,"order_id":306,"item":51,"price":210,"qty":2,"custimization":null,"created_at":"2021-05-27T17:52:56.000000Z","updated_at":"2021-05-27T17:52:56.000000Z","itemName":"chinese bhel"}]},{"id":318,"order_id":"#113064","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-05-28","time":"05:28 pm","payment_type":"COD","payment_token":null,"payment_status":"0","amount":366,"admin_commission":54,"vendor_amount":312,"delivery_type":"HOME","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":11,"delivery_charge":150,"order_status":"CANCEL","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":10.5,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"},{\"tax\":10.5,\"name\":\"other tax\"}]","order_start_time":null,"order_end_time":null,"created_at":"2021-05-28T20:31:13.000000Z","updated_at":"2021-05-28T21:31:22.000000Z","orderItems":[{"id":545,"order_id":318,"item":51,"price":105,"qty":1,"custimization":null,"created_at":"2021-05-28T20:31:13.000000Z","updated_at":"2021-05-28T20:31:13.000000Z","itemName":"chinese bhel"}]},{"id":326,"order_id":"#666949","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-05-29","time":"11:53 pm","payment_type":"COD","payment_token":null,"payment_status":"0","amount":723,"admin_commission":108,"vendor_amount":615,"delivery_type":"SHOP","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":null,"delivery_charge":150,"order_status":"CANCEL","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":21.0,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"},{\"tax\":21.0,\"name\":\"other tax\"}]","order_start_time":null,"order_end_time":null,"created_at":"2021-05-30T03:53:38.000000Z","updated_at":"2021-05-30T05:24:56.000000Z","orderItems":[{"id":554,"order_id":326,"item":50,"price":105,"qty":1,"custimization":null,"created_at":"2021-05-30T03:53:38.000000Z","updated_at":"2021-05-30T03:53:38.000000Z","itemName":"manchurian"},{"id":555,"order_id":326,"item":51,"price":105,"qty":1,"custimization":null,"created_at":"2021-05-30T03:53:38.000000Z","updated_at":"2021-05-30T03:53:38.000000Z","itemName":"chinese bhel"}]},{"id":343,"order_id":"#171819","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-05-31","time":"03:49 pm","payment_type":"COD","payment_token":null,"payment_status":"0","amount":502,"admin_commission":75,"vendor_amount":427,"delivery_type":"HOME","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":22,"delivery_charge":150,"order_status":"APPROVE","cancel_by":"user","cancel_reason":"h","tax":"[{\"tax\":21.0,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"},{\"tax\":21.0,\"name\":\"other tax\"}]","order_start_time":"09:33 pm","order_end_time":null,"created_at":"2021-05-31T10:19:41.000000Z","updated_at":"2021-05-31T16:03:58.000000Z","orderItems":[{"id":573,"order_id":343,"item":50,"price":105,"qty":1,"custimization":null,"created_at":"2021-05-31T10:19:41.000000Z","updated_at":"2021-05-31T10:19:41.000000Z","itemName":"manchurian"},{"id":574,"order_id":343,"item":51,"price":105,"qty":1,"custimization":null,"created_at":"2021-05-31T10:19:41.000000Z","updated_at":"2021-05-31T10:19:41.000000Z","itemName":"chinese bhel"}]},{"id":348,"order_id":"#586752","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-05-31","time":"11:16 pm","payment_type":"COD","payment_token":null,"payment_status":"0","amount":1138,"admin_commission":170,"vendor_amount":968,"delivery_type":"HOME","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":22,"delivery_charge":150,"order_status":"CANCEL","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":42.0,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"},{\"tax\":42.0,\"name\":\"other tax\"}]","order_start_time":null,"order_end_time":null,"created_at":"2021-05-31T21:16:08.000000Z","updated_at":"2021-05-31T22:26:47.000000Z","orderItems":[{"id":580,"order_id":348,"item":50,"price":420,"qty":4,"custimization":null,"created_at":"2021-05-31T21:16:08.000000Z","updated_at":"2021-05-31T21:16:08.000000Z","itemName":"manchurian"}]},{"id":349,"order_id":"#998329","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-05-31","time":"04:34 pm","payment_type":"COD","payment_token":null,"payment_status":"0","amount":4410,"admin_commission":661,"vendor_amount":3749,"delivery_type":"HOME","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":22,"delivery_charge":150,"order_status":"CANCEL","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":31.5,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"},{\"tax\":31.5,\"name\":\"other tax\"}]","order_start_time":null,"order_end_time":null,"created_at":"2021-05-31T21:34:36.000000Z","updated_at":"2021-05-31T22:38:22.000000Z","orderItems":[{"id":581,"order_id":349,"item":50,"price":105,"qty":1,"custimization":null,"created_at":"2021-05-31T21:34:36.000000Z","updated_at":"2021-05-31T21:34:36.000000Z","itemName":"manchurian"},{"id":582,"order_id":349,"item":51,"price":210,"qty":2,"custimization":null,"created_at":"2021-05-31T21:34:36.000000Z","updated_at":"2021-05-31T21:34:36.000000Z","itemName":"chinese bhel"}]},{"id":350,"order_id":"#562346","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-05-31","time":"07:09 pm","payment_type":"COD","payment_token":null,"payment_status":"0","amount":5200,"admin_commission":780,"vendor_amount":4420,"delivery_type":"HOME","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":22,"delivery_charge":150,"order_status":"CANCEL","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":21.0,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"},{\"tax\":21.0,\"name\":\"other tax\"}]","order_start_time":null,"order_end_time":null,"created_at":"2021-05-31T22:09:56.000000Z","updated_at":"2021-05-31T23:17:47.000000Z","orderItems":[{"id":583,"order_id":350,"item":50,"price":210,"qty":2,"custimization":null,"created_at":"2021-05-31T22:09:56.000000Z","updated_at":"2021-05-31T22:09:56.000000Z","itemName":"manchurian"}]},{"id":352,"order_id":"#664580","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-06-01","time":"04:28 am","payment_type":"COD","payment_token":null,"payment_status":"0","amount":502,"admin_commission":75,"vendor_amount":427,"delivery_type":"HOME","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":22,"delivery_charge":150,"order_status":"CANCEL","cancel_by":"user","cancel_reason":"mistake","tax":"[{\"tax\":21.0,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"},{\"tax\":21.0,\"name\":\"other tax\"}]","order_start_time":"04:30 am","order_end_time":null,"created_at":"2021-05-31T22:59:48.000000Z","updated_at":"2021-05-31T23:01:51.000000Z","orderItems":[{"id":587,"order_id":352,"item":50,"price":210,"qty":2,"custimization":null,"created_at":"2021-05-31T22:59:48.000000Z","updated_at":"2021-05-31T22:59:48.000000Z","itemName":"manchurian"}]},{"id":353,"order_id":"#970349","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-05-31","time":"09:45 pm","payment_type":"COD","payment_token":null,"payment_status":"0","amount":1449,"admin_commission":null,"vendor_amount":null,"delivery_type":"HOME","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":22,"delivery_charge":150,"order_status":"CANCEL","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":21.0,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"},{\"tax\":21.0,\"name\":\"other tax\"}]","order_start_time":null,"order_end_time":null,"created_at":"2021-06-01T00:45:56.000000Z","updated_at":"2021-06-01T01:56:57.000000Z","orderItems":[{"id":588,"order_id":353,"item":51,"price":210,"qty":2,"custimization":null,"created_at":"2021-06-01T00:45:56.000000Z","updated_at":"2021-06-01T00:45:56.000000Z","itemName":"chinese bhel"}]},{"id":354,"order_id":"#393377","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-05-31","time":"09:45 pm","payment_type":"COD","payment_token":null,"payment_status":"0","amount":1449,"admin_commission":null,"vendor_amount":null,"delivery_type":"HOME","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":22,"delivery_charge":150,"order_status":"CANCEL","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":21.0,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"},{\"tax\":21.0,\"name\":\"other tax\"}]","order_start_time":null,"order_end_time":null,"created_at":"2021-06-01T00:46:01.000000Z","updated_at":"2021-06-01T01:56:57.000000Z","orderItems":[{"id":589,"order_id":354,"item":51,"price":210,"qty":2,"custimization":null,"created_at":"2021-06-01T00:46:01.000000Z","updated_at":"2021-06-01T00:46:01.000000Z","itemName":"chinese bhel"}]},{"id":355,"order_id":"#428217","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-05-31","time":"09:19 pm","payment_type":"COD","payment_token":null,"payment_status":"0","amount":602,"admin_commission":null,"vendor_amount":null,"delivery_type":"HOME","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":22,"delivery_charge":150,"order_status":"CANCEL","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":21.0,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"},{\"tax\":21.0,\"name\":\"other tax\"}]","order_start_time":null,"order_end_time":null,"created_at":"2021-06-01T01:19:36.000000Z","updated_at":"2021-06-01T02:51:51.000000Z","orderItems":[{"id":590,"order_id":355,"item":50,"price":105,"qty":1,"custimization":null,"created_at":"2021-06-01T01:19:36.000000Z","updated_at":"2021-06-01T01:19:36.000000Z","itemName":"manchurian"},{"id":591,"order_id":355,"item":51,"price":105,"qty":1,"custimization":null,"created_at":"2021-06-01T01:19:36.000000Z","updated_at":"2021-06-01T01:19:36.000000Z","itemName":"chinese bhel"}]},{"id":356,"order_id":"#729967","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-05-31","time":"09:19 pm","payment_type":"COD","payment_token":null,"payment_status":"0","amount":602,"admin_commission":null,"vendor_amount":null,"delivery_type":"HOME","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":22,"delivery_charge":150,"order_status":"CANCEL","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":21.0,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"},{\"tax\":21.0,\"name\":\"other tax\"}]","order_start_time":null,"order_end_time":null,"created_at":"2021-06-01T01:19:45.000000Z","updated_at":"2021-06-01T02:51:51.000000Z","orderItems":[{"id":592,"order_id":356,"item":50,"price":105,"qty":1,"custimization":null,"created_at":"2021-06-01T01:19:45.000000Z","updated_at":"2021-06-01T01:19:45.000000Z","itemName":"manchurian"},{"id":593,"order_id":356,"item":51,"price":105,"qty":1,"custimization":null,"created_at":"2021-06-01T01:19:45.000000Z","updated_at":"2021-06-01T01:19:45.000000Z","itemName":"chinese bhel"}]},{"id":357,"order_id":"#142879","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-05-31","time":"09:19 pm","payment_type":"COD","payment_token":null,"payment_status":"0","amount":602,"admin_commission":null,"vendor_amount":null,"delivery_type":"HOME","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":22,"delivery_charge":150,"order_status":"CANCEL","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":21.0,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"},{\"tax\":21.0,\"name\":\"other tax\"}]","order_start_time":null,"order_end_time":null,"created_at":"2021-06-01T01:20:26.000000Z","updated_at":"2021-06-01T02:51:51.000000Z","orderItems":[{"id":594,"order_id":357,"item":50,"price":105,"qty":1,"custimization":null,"created_at":"2021-06-01T01:20:26.000000Z","updated_at":"2021-06-01T01:20:26.000000Z","itemName":"manchurian"},{"id":595,"order_id":357,"item":51,"price":105,"qty":1,"custimization":null,"created_at":"2021-06-01T01:20:26.000000Z","updated_at":"2021-06-01T01:20:26.000000Z","itemName":"chinese bhel"}]},{"id":358,"order_id":"#878612","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-05-31","time":"09:19 pm","payment_type":"COD","payment_token":null,"payment_status":"0","amount":602,"admin_commission":null,"vendor_amount":null,"delivery_type":"HOME","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":22,"delivery_charge":150,"order_status":"CANCEL","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":21.0,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"},{\"tax\":21.0,\"name\":\"other tax\"}]","order_start_time":null,"order_end_time":null,"created_at":"2021-06-01T01:20:35.000000Z","updated_at":"2021-06-01T02:51:51.000000Z","orderItems":[{"id":596,"order_id":358,"item":50,"price":105,"qty":1,"custimization":null,"created_at":"2021-06-01T01:20:35.000000Z","updated_at":"2021-06-01T01:20:35.000000Z","itemName":"manchurian"},{"id":597,"order_id":358,"item":51,"price":105,"qty":1,"custimization":null,"created_at":"2021-06-01T01:20:35.000000Z","updated_at":"2021-06-01T01:20:35.000000Z","itemName":"chinese bhel"}]},{"id":362,"order_id":"#785822","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-06-01","time":"01:23 pm","payment_type":"COD","payment_token":null,"payment_status":"0","amount":618,"admin_commission":null,"vendor_amount":null,"delivery_type":"HOME","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":22,"delivery_charge":150,"order_status":"CANCEL","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":10.5,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"},{\"tax\":10.5,\"name\":\"other tax\"}]","order_start_time":null,"order_end_time":null,"created_at":"2021-06-01T03:23:26.000000Z","updated_at":"2021-06-01T04:24:12.000000Z","orderItems":[{"id":610,"order_id":362,"item":50,"price":105,"qty":1,"custimization":null,"created_at":"2021-06-01T03:23:26.000000Z","updated_at":"2021-06-01T03:23:26.000000Z","itemName":"manchurian"}]},{"id":363,"order_id":"#700685","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-06-01","time":"01:23 pm","payment_type":"COD","payment_token":null,"payment_status":"0","amount":618,"admin_commission":null,"vendor_amount":null,"delivery_type":"HOME","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":22,"delivery_charge":150,"order_status":"CANCEL","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":10.5,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"},{\"tax\":10.5,\"name\":\"other tax\"}]","order_start_time":null,"order_end_time":null,"created_at":"2021-06-01T03:23:29.000000Z","updated_at":"2021-06-01T04:24:12.000000Z","orderItems":[{"id":611,"order_id":363,"item":50,"price":105,"qty":1,"custimization":null,"created_at":"2021-06-01T03:23:29.000000Z","updated_at":"2021-06-01T03:23:29.000000Z","itemName":"manchurian"}]},{"id":377,"order_id":"#754595","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-06-01","time":"12:50 am","payment_type":"COD","payment_token":null,"payment_status":"0","amount":376,"admin_commission":null,"vendor_amount":null,"delivery_type":"HOME","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":11,"delivery_charge":150,"order_status":"CANCEL","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":10.5,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"},{\"tax\":10.5,\"name\":\"other tax\"}]","order_start_time":null,"order_end_time":null,"created_at":"2021-06-01T05:50:48.000000Z","updated_at":"2021-06-01T06:53:36.000000Z","orderItems":[{"id":625,"order_id":377,"item":50,"price":105,"qty":1,"custimization":null,"created_at":"2021-06-01T05:50:48.000000Z","updated_at":"2021-06-01T05:50:48.000000Z","itemName":"manchurian"}]},{"id":378,"order_id":"#812983","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-06-01","time":"12:50 am","payment_type":"COD","payment_token":null,"payment_status":"0","amount":376,"admin_commission":null,"vendor_amount":null,"delivery_type":"HOME","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":11,"delivery_charge":150,"order_status":"CANCEL","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":10.5,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"},{\"tax\":10.5,\"name\":\"other tax\"}]","order_start_time":null,"order_end_time":null,"created_at":"2021-06-01T05:50:52.000000Z","updated_at":"2021-06-01T06:53:36.000000Z","orderItems":[{"id":626,"order_id":378,"item":50,"price":105,"qty":1,"custimization":null,"created_at":"2021-06-01T05:50:52.000000Z","updated_at":"2021-06-01T05:50:52.000000Z","itemName":"manchurian"}]},{"id":384,"order_id":"#202823","vendor_id":49,"user_id":193,"delivery_person_id":null,"date":"2021-06-01","time":"04:49 pm","payment_type":"COD","payment_token":null,"payment_status":"0","amount":352,"admin_commission":52,"vendor_amount":300,"delivery_type":"SHOP","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":null,"delivery_charge":null,"order_status":"CANCEL","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":21.0,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"},{\"tax\":21.0,\"name\":\"other tax\"}]","order_start_time":null,"order_end_time":null,"created_at":"2021-06-01T11:19:12.000000Z","updated_at":"2021-06-01T12:22:50.000000Z","orderItems":[{"id":633,"order_id":384,"item":50,"price":210,"qty":2,"custimization":null,"created_at":"2021-06-01T11:19:12.000000Z","updated_at":"2021-06-01T11:19:12.000000Z","itemName":"manchurian"}]},{"id":385,"order_id":"#154361","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-06-01","time":"11:02 am","payment_type":"COD","payment_token":null,"payment_status":"0","amount":352,"admin_commission":null,"vendor_amount":null,"delivery_type":"HOME","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":22,"delivery_charge":null,"order_status":"CANCEL","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":21.0,\"name\":\"other tax\"},{\"tax\":21.0,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"}]","order_start_time":null,"order_end_time":null,"created_at":"2021-06-01T15:02:40.000000Z","updated_at":"2021-06-01T16:42:03.000000Z","orderItems":[{"id":634,"order_id":385,"item":50,"price":105,"qty":1,"custimization":null,"created_at":"2021-06-01T15:02:40.000000Z","updated_at":"2021-06-01T15:02:40.000000Z","itemName":"manchurian"},{"id":635,"order_id":385,"item":51,"price":105,"qty":1,"custimization":null,"created_at":"2021-06-01T15:02:40.000000Z","updated_at":"2021-06-01T15:02:40.000000Z","itemName":"chinese bhel"}]},{"id":386,"order_id":"#429456","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-06-01","time":"11:02 am","payment_type":"COD","payment_token":null,"payment_status":"0","amount":352,"admin_commission":null,"vendor_amount":null,"delivery_type":"HOME","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":22,"delivery_charge":null,"order_status":"CANCEL","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":21.0,\"name\":\"other tax\"},{\"tax\":21.0,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"}]","order_start_time":null,"order_end_time":null,"created_at":"2021-06-01T15:02:52.000000Z","updated_at":"2021-06-01T16:42:03.000000Z","orderItems":[{"id":636,"order_id":386,"item":50,"price":105,"qty":1,"custimization":null,"created_at":"2021-06-01T15:02:52.000000Z","updated_at":"2021-06-01T15:02:52.000000Z","itemName":"manchurian"},{"id":637,"order_id":386,"item":51,"price":105,"qty":1,"custimization":null,"created_at":"2021-06-01T15:02:52.000000Z","updated_at":"2021-06-01T15:02:52.000000Z","itemName":"chinese bhel"}]},{"id":387,"order_id":"#223673","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-06-01","time":"11:02 am","payment_type":"COD","payment_token":null,"payment_status":"0","amount":352,"admin_commission":null,"vendor_amount":null,"delivery_type":"HOME","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":22,"delivery_charge":null,"order_status":"CANCEL","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":21.0,\"name\":\"other tax\"},{\"tax\":21.0,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"}]","order_start_time":null,"order_end_time":null,"created_at":"2021-06-01T15:03:12.000000Z","updated_at":"2021-06-01T16:42:03.000000Z","orderItems":[{"id":638,"order_id":387,"item":50,"price":105,"qty":1,"custimization":null,"created_at":"2021-06-01T15:03:12.000000Z","updated_at":"2021-06-01T15:03:12.000000Z","itemName":"manchurian"},{"id":639,"order_id":387,"item":51,"price":105,"qty":1,"custimization":null,"created_at":"2021-06-01T15:03:12.000000Z","updated_at":"2021-06-01T15:03:12.000000Z","itemName":"chinese bhel"}]},{"id":389,"order_id":"#551079","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-06-01","time":"03:26 pm","payment_type":"COD","payment_token":null,"payment_status":"0","amount":602,"admin_commission":null,"vendor_amount":null,"delivery_type":"HOME","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":22,"delivery_charge":150,"order_status":"CANCEL","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":21.0,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"},{\"tax\":21.0,\"name\":\"other tax\"}]","order_start_time":null,"order_end_time":null,"created_at":"2021-06-01T19:26:36.000000Z","updated_at":"2021-06-01T20:34:58.000000Z","orderItems":[{"id":642,"order_id":389,"item":50,"price":105,"qty":1,"custimization":null,"created_at":"2021-06-01T19:26:36.000000Z","updated_at":"2021-06-01T19:26:36.000000Z","itemName":"manchurian"},{"id":643,"order_id":389,"item":51,"price":105,"qty":1,"custimization":null,"created_at":"2021-06-01T19:26:36.000000Z","updated_at":"2021-06-01T19:26:36.000000Z","itemName":"chinese bhel"}]},{"id":391,"order_id":"#914827","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-06-02","time":"02:41 am","payment_type":"COD","payment_token":null,"payment_status":"0","amount":226,"admin_commission":33,"vendor_amount":193,"delivery_type":"SHOP","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":null,"delivery_charge":null,"order_status":"CANCEL","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":10.5,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"},{\"tax\":10.5,\"name\":\"other tax\"}]","order_start_time":null,"order_end_time":null,"created_at":"2021-06-01T20:41:37.000000Z","updated_at":"2021-06-01T22:32:25.000000Z","orderItems":[{"id":647,"order_id":391,"item":50,"price":105,"qty":1,"custimization":null,"created_at":"2021-06-01T20:41:37.000000Z","updated_at":"2021-06-01T20:41:37.000000Z","itemName":"manchurian"}]},{"id":392,"order_id":"#643210","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-06-02","time":"02:16 am","payment_type":"COD","payment_token":null,"payment_status":"0","amount":226,"admin_commission":33,"vendor_amount":193,"delivery_type":"SHOP","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":null,"delivery_charge":null,"order_status":"CANCEL","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":10.5,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"},{\"tax\":10.5,\"name\":\"other tax\"}]","order_start_time":null,"order_end_time":null,"created_at":"2021-06-01T20:46:29.000000Z","updated_at":"2021-06-01T22:32:25.000000Z","orderItems":[{"id":648,"order_id":392,"item":50,"price":105,"qty":1,"custimization":null,"created_at":"2021-06-01T20:46:29.000000Z","updated_at":"2021-06-01T20:46:29.000000Z","itemName":"manchurian"}]},{"id":400,"order_id":"#197543","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-06-02","time":"08:29 pm","payment_type":"COD","payment_token":null,"payment_status":"0","amount":352,"admin_commission":52,"vendor_amount":300,"delivery_type":"SHOP","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":null,"delivery_charge":null,"order_status":"CANCEL","cancel_by":"user","cancel_reason":"no","tax":"[{\"tax\":21.0,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"},{\"tax\":21.0,\"name\":\"other tax\"}]","order_start_time":null,"order_end_time":null,"created_at":"2021-06-02T14:59:11.000000Z","updated_at":"2021-06-02T14:59:43.000000Z","orderItems":[{"id":657,"order_id":400,"item":50,"price":105,"qty":1,"custimization":null,"created_at":"2021-06-02T14:59:11.000000Z","updated_at":"2021-06-02T14:59:11.000000Z","itemName":"manchurian"},{"id":658,"order_id":400,"item":51,"price":105,"qty":1,"custimization":null,"created_at":"2021-06-02T14:59:11.000000Z","updated_at":"2021-06-02T14:59:11.000000Z","itemName":"chinese bhel"}]},{"id":407,"order_id":"#839641","vendor_id":49,"user_id":136,"delivery_person_id":null,"date":"2021-06-02","time":"10:46 pm","payment_type":"COD","payment_token":null,"payment_status":"1","amount":287,"admin_commission":43,"vendor_amount":244,"delivery_type":"SHOP","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":0,"address_id":null,"delivery_charge":null,"order_status":"APPROVE","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":15,\"name\":\"basic tax\"},{\"tax\":100,\"name\":\"gst\"},{\"tax\":15,\"name\":\"other tax\"}]","order_start_time":null,"order_end_time":null,"created_at":"2021-06-02T17:16:12.000000Z","updated_at":"2021-06-02T17:16:12.000000Z","orderItems":[{"id":667,"order_id":407,"item":45,"price":157,"qty":1,"custimization":null,"created_at":"2021-06-02T17:16:12.000000Z","updated_at":"2021-06-02T17:16:12.000000Z","itemName":"dhosa"}]},{"id":408,"order_id":"#249808","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-06-02","time":"11:02 pm","payment_type":"COD","payment_token":null,"payment_status":"1","amount":287,"admin_commission":43,"vendor_amount":244,"delivery_type":"SHOP","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":0,"address_id":null,"delivery_charge":null,"order_status":"PREPARE_FOR_ORDER","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":15,\"name\":\"basic tax\"},{\"tax\":100,\"name\":\"gst\"},{\"tax\":15,\"name\":\"other tax\"}]","order_start_time":null,"order_end_time":null,"created_at":"2021-06-02T17:32:03.000000Z","updated_at":"2021-06-04T16:39:33.000000Z","orderItems":[{"id":668,"order_id":408,"item":45,"price":157,"qty":1,"custimization":null,"created_at":"2021-06-02T17:32:03.000000Z","updated_at":"2021-06-02T17:32:03.000000Z","itemName":"dhosa"}]},{"id":416,"order_id":"#888886","vendor_id":49,"user_id":197,"delivery_person_id":null,"date":"2021-06-03","time":"04:59 pm","payment_type":"COD","payment_token":null,"payment_status":"0","amount":226,"admin_commission":33,"vendor_amount":193,"delivery_type":"SHOP","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":null,"delivery_charge":null,"order_status":"CANCEL","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":10.5,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"},{\"tax\":10.5,\"name\":\"other tax\"}]","order_start_time":null,"order_end_time":null,"created_at":"2021-06-03T11:29:04.000000Z","updated_at":"2021-06-03T13:47:47.000000Z","orderItems":[{"id":681,"order_id":416,"item":50,"price":105,"qty":1,"custimization":null,"created_at":"2021-06-03T11:29:04.000000Z","updated_at":"2021-06-03T11:29:04.000000Z","itemName":"manchurian"}]},{"id":423,"order_id":"#284998","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-06-04","time":"05:11 pm","payment_type":"COD","payment_token":null,"payment_status":"0","amount":5549,"admin_commission":832,"vendor_amount":4717,"delivery_type":"HOME","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":28,"delivery_charge":150,"order_status":"CANCEL","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":36.75,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"},{\"tax\":36.75,\"name\":\"other tax\"}]","order_start_time":null,"order_end_time":null,"created_at":"2021-06-04T14:11:35.000000Z","updated_at":"2021-06-04T15:14:14.000000Z","orderItems":[{"id":690,"order_id":423,"item":45,"price":158,"qty":1,"custimization":null,"created_at":"2021-06-04T14:11:35.000000Z","updated_at":"2021-06-04T14:11:35.000000Z","itemName":"dhosa"},{"id":691,"order_id":423,"item":50,"price":105,"qty":1,"custimization":null,"created_at":"2021-06-04T14:11:35.000000Z","updated_at":"2021-06-04T14:11:35.000000Z","itemName":"manchurian"},{"id":692,"order_id":423,"item":51,"price":105,"qty":1,"custimization":null,"created_at":"2021-06-04T14:11:35.000000Z","updated_at":"2021-06-04T14:11:35.000000Z","itemName":"chinese bhel"}]},{"id":425,"order_id":"#466212","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-06-04","time":"06:26 pm","payment_type":"COD","payment_token":null,"payment_status":"0","amount":730,"admin_commission":109,"vendor_amount":621,"delivery_type":"SHOP","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":null,"delivery_charge":null,"order_status":"CANCEL","cancel_by":"user","cancel_reason":"test","tax":"[{\"tax\":52.5,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"},{\"tax\":52.5,\"name\":\"other tax\"}]","order_start_time":null,"order_end_time":null,"created_at":"2021-06-04T14:26:33.000000Z","updated_at":"2021-06-04T14:27:32.000000Z","orderItems":[{"id":694,"order_id":425,"item":50,"price":210,"qty":2,"custimization":null,"created_at":"2021-06-04T14:26:33.000000Z","updated_at":"2021-06-04T14:26:33.000000Z","itemName":"manchurian"},{"id":695,"order_id":425,"item":51,"price":315,"qty":3,"custimization":null,"created_at":"2021-06-04T14:26:33.000000Z","updated_at":"2021-06-04T14:26:33.000000Z","itemName":"chinese bhel"}]},{"id":430,"order_id":"#910609","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-06-04","time":"09:44 pm","payment_type":"COD","payment_token":null,"payment_status":"1","amount":287,"admin_commission":43,"vendor_amount":244,"delivery_type":"SHOP","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":0,"address_id":null,"delivery_charge":null,"order_status":"PREPARE_FOR_ORDER","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":15,\"name\":\"basic tax\"},{\"tax\":100,\"name\":\"gst\"},{\"tax\":15,\"name\":\"other tax\"}]","order_start_time":"10:09 pm","order_end_time":null,"created_at":"2021-06-04T16:14:32.000000Z","updated_at":"2021-06-05T06:04:42.000000Z","orderItems":[{"id":702,"order_id":430,"item":45,"price":157,"qty":1,"custimization":null,"created_at":"2021-06-04T16:14:32.000000Z","updated_at":"2021-06-04T16:14:32.000000Z","itemName":"dhosa"}]},{"id":436,"order_id":"#420487","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-06-04","time":"03:02 pm","payment_type":"COD","payment_token":null,"payment_status":"0","amount":1106,"admin_commission":165,"vendor_amount":941,"delivery_type":"SHOP","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":null,"delivery_charge":150,"order_status":"CANCEL","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":63.0,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"},{\"tax\":63.0,\"name\":\"other tax\"}]","order_start_time":null,"order_end_time":null,"created_at":"2021-06-04T19:02:44.000000Z","updated_at":"2021-06-04T20:24:42.000000Z","orderItems":[{"id":711,"order_id":436,"item":51,"price":105,"qty":1,"custimization":null,"created_at":"2021-06-04T19:02:44.000000Z","updated_at":"2021-06-04T19:02:44.000000Z","itemName":"chinese bhel"},{"id":712,"order_id":436,"item":45,"price":315,"qty":2,"custimization":null,"created_at":"2021-06-04T19:02:44.000000Z","updated_at":"2021-06-04T19:02:44.000000Z","itemName":"dhosa"},{"id":713,"order_id":436,"item":46,"price":105,"qty":2,"custimization":[],"created_at":"2021-06-04T19:02:44.000000Z","updated_at":"2021-06-04T19:02:44.000000Z","itemName":"idali"},{"id":714,"order_id":436,"item":50,"price":105,"qty":1,"custimization":null,"created_at":"2021-06-04T19:02:44.000000Z","updated_at":"2021-06-04T19:02:44.000000Z","itemName":"manchurian"}]},{"id":437,"order_id":"#283315","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-06-05","time":"12:35 am","payment_type":"COD","payment_token":null,"payment_status":"0","amount":376,"admin_commission":56,"vendor_amount":320,"delivery_type":"HOME","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":25,"delivery_charge":150,"order_status":"CANCEL","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":10.5,\"name\":\"other tax\"},{\"tax\":10.5,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"}]","order_start_time":null,"order_end_time":null,"created_at":"2021-06-04T20:35:05.000000Z","updated_at":"2021-06-04T21:48:12.000000Z","orderItems":[{"id":715,"order_id":437,"item":50,"price":105,"qty":1,"custimization":null,"created_at":"2021-06-04T20:35:05.000000Z","updated_at":"2021-06-04T20:35:05.000000Z","itemName":"manchurian"}]},{"id":440,"order_id":"#985269","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-06-05","time":"10:16 am","payment_type":"COD","payment_token":null,"payment_status":"0","amount":502,"admin_commission":75,"vendor_amount":427,"delivery_type":"HOME","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":25,"delivery_charge":150,"order_status":"CANCEL","cancel_by":"user","cancel_reason":"too time taking","tax":"[{\"tax\":21.0,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"},{\"tax\":21.0,\"name\":\"other tax\"}]","order_start_time":"10:17 am","order_end_time":null,"created_at":"2021-06-05T04:46:47.000000Z","updated_at":"2021-06-05T04:50:02.000000Z","orderItems":[{"id":719,"order_id":440,"item":50,"price":105,"qty":1,"custimization":null,"created_at":"2021-06-05T04:46:47.000000Z","updated_at":"2021-06-05T04:46:47.000000Z","itemName":"manchurian"},{"id":720,"order_id":440,"item":51,"price":105,"qty":1,"custimization":null,"created_at":"2021-06-05T04:46:47.000000Z","updated_at":"2021-06-05T04:46:47.000000Z","itemName":"chinese bhel"}]},{"id":442,"order_id":"#224223","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-06-05","time":"02:42 pm","payment_type":"COD","payment_token":null,"payment_status":"0","amount":618,"admin_commission":92,"vendor_amount":526,"delivery_type":"HOME","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":null,"address_id":25,"delivery_charge":150,"order_status":"CANCEL","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":10.5,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"},{\"tax\":10.5,\"name\":\"other tax\"}]","order_start_time":null,"order_end_time":null,"created_at":"2021-06-05T09:12:13.000000Z","updated_at":"2021-06-05T10:25:46.000000Z","orderItems":[{"id":723,"order_id":442,"item":50,"price":105,"qty":1,"custimization":null,"created_at":"2021-06-05T09:12:13.000000Z","updated_at":"2021-06-05T09:12:13.000000Z","itemName":"manchurian"}]},{"id":452,"order_id":"#627972","vendor_id":49,"user_id":139,"delivery_person_id":null,"date":"2021-06-06","time":"07:53 pm","payment_type":"COD","payment_token":null,"payment_status":"1","amount":601,"admin_commission":90,"vendor_amount":511,"delivery_type":"SHOP","promocode_id":null,"promocode_price":0,"vendor_discount_id":null,"vendor_discount_price":0,"address_id":null,"delivery_charge":null,"order_status":"REJECT","cancel_by":null,"cancel_reason":null,"tax":"[{\"tax\":41,\"name\":\"basic tax\"},{\"tax\":100,\"name\":\"gst\"},{\"tax\":41,\"name\":\"other tax\"}]","order_start_time":"02:23 am","order_end_time":null,"created_at":"2021-06-06T14:23:42.000000Z","updated_at":"2021-06-06T20:54:01.000000Z","orderItems":[{"id":742,"order_id":452,"item":45,"price":315,"qty":2,"custimization":null,"created_at":"2021-06-06T14:23:42.000000Z","updated_at":"2021-06-06T14:23:42.000000Z","itemName":"dhosa"},{"id":743,"order_id":452,"item":50,"price":105,"qty":1,"custimization":null,"created_at":"2021-06-06T14:23:42.000000Z","updated_at":"2021-06-06T14:23:42.000000Z","itemName":"manchurian"}]}]

Future<BaseModel<OrdersResponse>> getOrders() async {
  OrdersResponse response;
  try {
    response = await ApiClient(ApiHeader().dioData()).orders();
  } catch (error, stacktrace) {
    print("Exception occur: $error stackTrace: $stacktrace");
    return BaseModel()..setException(ServerError.withError(error: error));
  }
  return BaseModel()..data = response;
}

class OrdersResponse {
  bool _success;
  List<Data> _data;

  bool get success => _success;

  List<Data> get data => _data;

  OrdersResponse({bool success, List<Data> data}) {
    _success = success;
    _data = data;
  }

  OrdersResponse.fromJson(dynamic json) {
    _success = json["success"];
    if (json["data"] != null) {
      _data = [];
      json["data"].forEach((v) {
        _data.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["success"] = _success;
    if (_data != null) {
      map["data"] = _data.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 180
/// order_id : "#383884"
/// vendor_id : 49
/// user_id : 139
/// delivery_person_id : null
/// date : "2021-05-10"
/// time : "09:37 am"
/// payment_type : "COD"
/// payment_token : null
/// payment_status : "0"
/// amount : 502
/// admin_commission : 75
/// vendor_amount : 427
/// delivery_type : "HOME"
/// promocode_id : null
/// promocode_price : 0
/// vendor_discount_id : null
/// vendor_discount_price : null
/// address_id : 13
/// delivery_charge : 150
/// order_status : "CANCEL"
/// cancel_by : null
/// cancel_reason : null
/// tax : "[{\"tax\":21.0,\"name\":\"basic tax\"},{\"tax\":100.0,\"name\":\"gst\"},{\"tax\":21.0,\"name\":\"other tax\"}]"
/// order_start_time : null
/// order_end_time : null
/// created_at : "2021-05-10T04:07:07.000000Z"
/// updated_at : "2021-05-10T09:53:41.000000Z"
/// orderItems : [{"id":308,"order_id":180,"item":50,"price":105,"qty":1,"custimization":null,"created_at":"2021-05-10T04:07:07.000000Z","updated_at":"2021-05-10T04:07:07.000000Z","itemName":"manchurian"},{"id":309,"order_id":180,"item":51,"price":105,"qty":1,"custimization":null,"created_at":"2021-05-10T04:07:07.000000Z","updated_at":"2021-05-10T04:07:07.000000Z","itemName":"chinese bhel"}]

class Data {
  int _id;
  String _orderId;
  int _vendorId;
  int _userId;
  int _deliveryPersonId;
  String _date;
  String _time;
  String _paymentType;
  String _paymentToken;
  String _paymentStatus;
  int _amount;
  int _adminCommission;
  int _vendorAmount;
  String _deliveryType;
  int _promocodeId;
  int _promocodePrice;
  int _vendorDiscountId;
  int _vendorDiscountPrice;
  int _addressId;
  int _deliveryCharge;
  String _orderStatus;
  String _cancelBy;
  String _cancelReason;
  String _tax;
  String _orderStartTime;
  String _orderEndTime;
  String _createdAt;
  String _updatedAt;
  String _userName;
  String _userPhone;
  String _vendorAddress;
  List<OrderItems> _orderItems;

  int get id => _id;

  String get orderId => _orderId;

  int get vendorId => _vendorId;

  int get userId => _userId;

  int get deliveryPersonId => _deliveryPersonId;

  String get date => _date;

  String get time => _time;

  String get paymentType => _paymentType;

  String get paymentToken => _paymentToken;

  String get paymentStatus => _paymentStatus;

  int get amount => _amount;

  int get adminCommission => _adminCommission;

  int get vendorAmount => _vendorAmount;

  String get deliveryType => _deliveryType;

  int get promocodeId => _promocodeId;

  int get promocodePrice => _promocodePrice;

  int get vendorDiscountId => _vendorDiscountId;

  int get vendorDiscountPrice => _vendorDiscountPrice;

  int get addressId => _addressId;

  int get deliveryCharge => _deliveryCharge;

  String get orderStatus => _orderStatus;

  String get cancelBy => _cancelBy;

  String get cancelReason => _cancelReason;

  String get tax => _tax;

  String get orderStartTime => _orderStartTime;

  String get orderEndTime => _orderEndTime;

  String get createdAt => _createdAt;

  String get updatedAt => _updatedAt;

  String get userName => _userName;

  String get userPhone => _userPhone;

  String get vendorAddress => _vendorAddress;

  List<OrderItems> get orderItems => _orderItems;

  Data(
      {int id,
      String orderId,
      int vendorId,
      int userId,
      int deliveryPersonId,
      String date,
      String time,
      String paymentType,
      String paymentToken,
      String paymentStatus,
      int amount,
      int adminCommission,
      int vendorAmount,
      String deliveryType,
      int promocodeId,
      int promocodePrice,
      int vendorDiscountId,
      int vendorDiscountPrice,
      int addressId,
      int deliveryCharge,
      String orderStatus,
      String cancelBy,
      String cancelReason,
      String tax,
      String orderStartTime,
      String orderEndTime,
      String createdAt,
      String updatedAt,
      String userName,
      String userPhone,
      String vendorAddress,
      List<OrderItems> orderItems}) {
    _id = id;
    _orderId = orderId;
    _vendorId = vendorId;
    _userId = userId;
    _deliveryPersonId = deliveryPersonId;
    _date = date;
    _time = time;
    _paymentType = paymentType;
    _paymentToken = paymentToken;
    _paymentStatus = paymentStatus;
    _amount = amount;
    _adminCommission = adminCommission;
    _vendorAmount = vendorAmount;
    _deliveryType = deliveryType;
    _promocodeId = promocodeId;
    _promocodePrice = promocodePrice;
    _vendorDiscountId = vendorDiscountId;
    _vendorDiscountPrice = vendorDiscountPrice;
    _addressId = addressId;
    _deliveryCharge = deliveryCharge;
    _orderStatus = orderStatus;
    _cancelBy = cancelBy;
    _cancelReason = cancelReason;
    _tax = tax;
    _orderStartTime = orderStartTime;
    _orderEndTime = orderEndTime;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _userName = userName;
    _userPhone = userPhone;
    _vendorAddress = vendorAddress;
    _orderItems = orderItems;
  }

  Data.fromJson(dynamic json) {
    _id = json["id"];
    _orderId = json["order_id"];
    _vendorId = json["vendor_id"];
    _userId = json["user_id"];
    _deliveryPersonId = json["delivery_person_id"];
    _date = json["date"];
    _time = json["time"];
    _paymentType = json["payment_type"];
    _paymentToken = json["payment_token"];
    _paymentStatus = json["payment_status"];
    _amount = json["amount"];
    _adminCommission = json["admin_commission"];
    _vendorAmount = json["vendor_amount"];
    _deliveryType = json["delivery_type"];
    _promocodeId = json["promocode_id"];
    _promocodePrice = json["promocode_price"];
    _vendorDiscountId = json["vendor_discount_id"];
    _vendorDiscountPrice = json["vendor_discount_price"];
    _addressId = json["address_id"];
    _deliveryCharge = json["delivery_charge"];
    _orderStatus = json["order_status"];
    _cancelBy = json["cancel_by"];
    _cancelReason = json["cancel_reason"];
    _tax = json["tax"];
    _orderStartTime = json["order_start_time"];
    _orderEndTime = json["order_end_time"];
    _createdAt = json["created_at"];
    _updatedAt = json["updated_at"];
    _userName = json["user_name"];
    _userPhone = json["user_phone"];
    _vendorAddress = json["vendorAddress"];
    if (json["orderItems"] != null) {
      _orderItems = [];
      json["orderItems"].forEach((v) {
        _orderItems.add(OrderItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["order_id"] = _orderId;
    map["vendor_id"] = _vendorId;
    map["user_id"] = _userId;
    map["delivery_person_id"] = _deliveryPersonId;
    map["date"] = _date;
    map["time"] = _time;
    map["payment_type"] = _paymentType;
    map["payment_token"] = _paymentToken;
    map["payment_status"] = _paymentStatus;
    map["amount"] = _amount;
    map["admin_commission"] = _adminCommission;
    map["vendor_amount"] = _vendorAmount;
    map["delivery_type"] = _deliveryType;
    map["promocode_id"] = _promocodeId;
    map["promocode_price"] = _promocodePrice;
    map["vendor_discount_id"] = _vendorDiscountId;
    map["vendor_discount_price"] = _vendorDiscountPrice;
    map["address_id"] = _addressId;
    map["delivery_charge"] = _deliveryCharge;
    map["order_status"] = _orderStatus;
    map["cancel_by"] = _cancelBy;
    map["cancel_reason"] = _cancelReason;
    map["tax"] = _tax;
    map["order_start_time"] = _orderStartTime;
    map["order_end_time"] = _orderEndTime;
    map["created_at"] = _createdAt;
    map["updated_at"] = _updatedAt;
    map["user_name"] = _userName;
    map["user_phone"] = _userPhone;
    map["vendorAddress"] = _vendorAddress;
    if (_orderItems != null) {
      map["orderItems"] = _orderItems.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 308
/// order_id : 180
/// item : 50
/// price : 105
/// qty : 1
/// custimization : null
/// created_at : "2021-05-10T04:07:07.000000Z"
/// updated_at : "2021-05-10T04:07:07.000000Z"
/// itemName : "manchurian"

class OrderItems {
  int _id;
  int _orderId;
  int _item;
  int _price;
  int _qty;
  dynamic _custimization;
  String _createdAt;
  String _updatedAt;
  String _itemName;

  int get id => _id;

  int get orderId => _orderId;

  int get item => _item;

  int get price => _price;

  int get qty => _qty;

  dynamic get custimization => _custimization;

  String get createdAt => _createdAt;

  String get updatedAt => _updatedAt;

  String get itemName => _itemName;

  OrderItems(
      {int id,
      int orderId,
      int item,
      int price,
      int qty,
      dynamic custimization,
      String createdAt,
      String updatedAt,
      String itemName}) {
    _id = id;
    _orderId = orderId;
    _item = item;
    _price = price;
    _qty = qty;
    _custimization = custimization;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _itemName = itemName;
  }

  OrderItems.fromJson(dynamic json) {
    _id = json["id"];
    _orderId = json["order_id"];
    _item = json["item"];
    _price = json["price"];
    _qty = json["qty"];
    _custimization = json["custimization"];
    _createdAt = json["created_at"];
    _updatedAt = json["updated_at"];
    _itemName = json["itemName"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["order_id"] = _orderId;
    map["item"] = _item;
    map["price"] = _price;
    map["qty"] = _qty;
    map["custimization"] = _custimization;
    map["created_at"] = _createdAt;
    map["updated_at"] = _updatedAt;
    map["itemName"] = _itemName;
    return map;
  }
}

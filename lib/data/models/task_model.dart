
// "_id": "698a2d7531f967e218aeec9d",
// "title": "A",
// "description": "v",
// "status": "New",
// "email": "boktimd15@gmail.com",
// "createdDate"
class TaskModel{
 final String id;
 final String title;
 final String description;
 final String status;
 final String email;
 final String createdDate;
 TaskModel({
   required this.id,
   required this.title,
   required this.description,
   required this.status,
   required this.email,
   required this.createdDate,
 });
 factory TaskModel.formJson(Map<String,dynamic>jsonData){
   return TaskModel(
       id: jsonData['_id'],
       title: jsonData['title'],
       description: jsonData['description'],
       status: jsonData['status'],
       email: jsonData['email'],
       createdDate: jsonData['createdDate']
   );
 }
}
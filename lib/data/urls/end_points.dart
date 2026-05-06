class Urls{
  static String baseUrl='https://task-manager-api.ostad.live/api/v1';
  static String registrationUrl='$baseUrl/Registration';
  static String loginUrl='$baseUrl/Login';
  static String createTaskUrl='$baseUrl/createTask';
  static String updatedProfileUrl='$baseUrl/ProfileUpdate';
  static String TaskStatusCountUrl='$baseUrl/taskStatusCount';
  static String listTaskByStatusUrl='$baseUrl/listTaskByStatus/New';
  static String progressTaskByStatusUrl='$baseUrl/listTaskByStatus/Progress';
  static String completedTaskByStatusUrl='$baseUrl/listTaskByStatus/Completed';
  static String cancelledTaskByStatusUrl='$baseUrl/listTaskByStatus/Cancelled';
  static String deleteTaskByStatusUrl(String taskId)=>'$baseUrl/deleteTask/$taskId';
  static String changeStatusUrl(String id,String status)=>'$baseUrl/updateTaskStatus/$id/$status';
}
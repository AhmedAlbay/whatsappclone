class ChatModel {
  final String? name;
  final String? currentMessage;
  final String? icon;
  final String? time;
  final bool? isGroup;
  final String? status;
   bool isSelected;
  final  int? id ;

  ChatModel({
    this.id,
    this.name,
    this.currentMessage,
    this.icon,
    this.time,
    this.isGroup,
    this.status,
    this.isSelected = false, // Default value for isSelected
  });
}

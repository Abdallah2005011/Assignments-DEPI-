void main() {
  print(sendMessage('Ahmed','Hello',true));
}
String sendMessage(String recipient, [String? message, bool urgent = false]) {
  return " $recipient: $message Urgent: ${urgent }";
}

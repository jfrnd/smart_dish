import { messaging } from "firebase-admin";
import { User } from "./user_doc";

export async function sendPushNotificationToUser(
  user: User,
  title: string,
  body: string,
  imageUrl: string,
  data?: { [key: string]: string } | undefined
): Promise<any> {
  if (user.token == "" || user.token == undefined) {
    console.log("User has no token.");
    return;
  }

  const message: messaging.Message = {
    token: user.token,
    notification: {
      title: title,
      body: body,
      imageUrl: imageUrl != "" ? imageUrl : undefined,
    },
    data: data,
  };

  return messaging()
    .send(message)
    .then((response) => {
      // Response is a message ID string.
      console.log(
        `Successfully sent message to ${user.userName} with token ${user.token}`,
        response
      );
      return { success: true };
    })
    .catch((error) => {
      return { error: error.code };
    });
}

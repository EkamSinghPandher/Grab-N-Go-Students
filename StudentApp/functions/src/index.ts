import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';
admin.initializeApp();

const db = admin.firestore();
const fcm = admin.messaging();

export const sendToDevice = functions.firestore.document('Students/{studentID}/{Orders}/{OrderID}/{Messages}/{messageID}').onCreate(async snapshot=>{
    const message = snapshot.data();
    const querySnapshot = await db.collection('Vendors').doc(message.vendorID).collection('Tokens').get();

    const tokens = querySnapshot.docs.map(snap => snap.id);
    const payload: admin.messaging.MessagingPayload = {
        notification:{
            title: "New Message from " + message.studName,
            body: message.text,
            clickAction: 'FLUTTER_NOTIFICATION_CLICK'
        }
    };

    return fcm.sendToDevice(tokens, payload);
})
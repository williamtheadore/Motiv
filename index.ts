// MOTIV APP INC.
// WILLIAM LITTLE
// 2022-05-11

import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
import algoliasearch from "algoliasearch";

const ALGOLIA_APP_ID = "NAW4Z6IS9L";
const ALGOLIA_ADMIN_KEY = "35451fd87ebb6dbbf8bf2e74633a7521";
const client = algoliasearch(ALGOLIA_APP_ID, ALGOLIA_ADMIN_KEY);
const userIndex = client.initIndex("w-little_motivapp_users");

admin.initializeApp();

// Listens to change
exports.addUsersToAlgolia = functions.firestore.document("/users/{docID}")
    .onWrite((change) => {
      if (change && change.after && change.after.data()) {
        const data: any = change.after.data();
        const record = {

          objectID: data.id,
          id: data.id,
          friends: data.friends,
          name: data.name,
          profilePhoto: data.profilePhoto,
          program: data.program,
          requests: data.requests,
          school: data.school,
          username: data.username,
        };

        return userIndex.saveObject(record);
        console.log("Successfully uploaded user to Algolia.");
      } else {
        console.log("No Change");
        return true;
      }
    });

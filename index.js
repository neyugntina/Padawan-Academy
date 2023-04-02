const { MongoClient, ObjectId } = require("mongodb");
const { Configuration, OpenAIApi } = require("openai");
const apikey = "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";
const configuration = new Configuration({
  apiKey: apikey,
});
const openai = new OpenAIApi(configuration);

// Create a new Question
async function createQuestion(data, db) {
  console.log(data);
  const result = await db.collection("questionDetails").insertOne(data);
  return result;
}

async function getQuestionById(id, db) {
  const result = await db
    .collection("questionDetails")
    .findOne({ _id: new ObjectId(id) });
  return result;
}

async function getQuestionsByCourse(id, db) {
  const result = await db
    .collection("questionDetails")
    .find({ courseID: id })
    .toArray();
  return result;
}
// Update a Question by ID
async function updateQuestionById(id, data, db) {
  const result = await db
    .collection("questionDetails")
    .updateOne({ _id: new ObjectId(id) }, { $set: data });
  if (result.modifiedCount === 1) {
    return "Question updated successfully";
  } else {
    throw new Error("Question not found");
  }
}

// Delete a Question by ID
async function deleteQuestionById(id, db) {
  const result = await db
    .collection("questionDetails")
    .deleteOne({ _id: new ObjectId(id) });
  if (result.deletedCount === 1) {
    return "Question deleted successfully";
  } else {
    throw new Error("Question not found");
  }
}
async function getCompletion(prompt) {
  // define the API request parameters
  try {
    const completion = await openai.createChatCompletion({
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content: prompt }],
    });
    const text = completion.data.choices[0].message;
    console.log(text);
    return text;
  } catch (error) {
    console.error("Error:", error);
  }
}

exports.handler = async (event, context) => {
  // Perform database operations here
  let result;
  let db;
  try {
    const uri =
      "mongodb+srv://:@userdb.fpmygks.mongodb.net/?retryWrites=true&w=majority";
    const client = new MongoClient(uri, {
      useNewUrlParser: true,
      useUnifiedTopology: true,
    });
    await client.connect();
    db = client.db("hacklahoma");
    console.log("Connected to the database");

    switch (event.httpMethod) {
      case "POST":
        const data = event.body;
        const prompt = data.prompt;
        console.log(prompt);
        //data["completion"] = await getCompletion(prompt);
        await createQuestion(data, db);

        return { statusCode: 201, body: "Question details created" };
      case "GET":
        if (event.path == "/questions/list") {
          result = await getQuestionsByCourse(
            event.queryStringParameters.id,
            db
          );
        } else {
          result = await getQuestionById(event.queryStringParameters.id, db);
        }

        return { statusCode: 200, body: JSON.stringify(result) };
      case "PATCH":
        result = await updateQuestionById(
          event.queryStringParameters.id,
          JSON.parse(event.body),
          db
        );
        return { statusCode: 200, body: JSON.stringify({ message: result }) };
      case "DELETE":
        result = await deleteQuestionById(event.queryStringParameters.id, db);
        return { statusCode: 200, body: JSON.stringify({ message: result }) };
      default:
        throw new Error("Unsupported method");
    }
  } catch (err) {
    return { statusCode: 500, body: JSON.stringify({ message: err.message }) };
  }
};

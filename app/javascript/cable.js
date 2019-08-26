// frontend/client/cable.js
import cable from "actioncable";

let consumer;

const createChannel = (...args) => {
  if (!consumer) {
    consumer = cable.createConsumer();
    console.log(consumer)
  }

  return consumer.subscriptions.create(...args);
};

export default createChannel;

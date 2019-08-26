import createChannel from 'cable';

const list = document.getElementById('messages-table')
const input = document.getElementById('message_content')

if (list) {
    const room = createChannel({channel: "RoomChannel", conversation: list.dataset.id}, {
    received({message}) {
      list.insertAdjacentHTML('beforeend', message)
      input.value = ''
    }
  });
}

import showModal from 'discourse/lib/show-modal';
import { ajax } from 'discourse/lib/ajax';

export default {
  actions: {
    convertToTicket() {
      var current_state = this.get('create_ticket_block');
      this.set('create_ticket_block', !current_state);
      // console.log('We are gooder');
    }
  }
};

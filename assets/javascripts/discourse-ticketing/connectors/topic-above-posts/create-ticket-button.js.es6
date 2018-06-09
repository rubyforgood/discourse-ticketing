
import { ajax } from 'discourse/lib/ajax';

export default {
  actions: {
    convertToTicket() {
      var current_state = this.get('create_ticket_block');
      this.set('create_ticket_block', !current_state);


      const priority = [
        {
            "id": "priority-high",
            "text": "priority-high",
            "count": 0,
            "pm_count": 0
        },
        {
            "id": "priority-immediate",
            "text": "priority-immediate",
            "count": 0,
            "pm_count": 0
        },
        {
            "id": "priority-low",
            "text": "priority-low",
            "count": 0,
            "pm_count": 0
        },
        {
            "id": "priority-normal",
            "text": "priority-normal",
            "count": 0,
            "pm_count": 0
        }
      ];

      this.set('list-priority', priority);
    }
  }
};
